// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:clashmi/app/clash/clash_config.dart';
import 'package:clashmi/app/local_services/vpn_service.dart';
import 'package:clashmi/app/modules/auto_update_manager.dart';
import 'package:clashmi/app/modules/clash_setting_manager.dart';
import 'package:clashmi/app/modules/profile_manager.dart';
import 'package:clashmi/app/modules/profile_patch_manager.dart';
import 'package:clashmi/app/modules/remote_config_manager.dart';
import 'package:clashmi/app/modules/setting_manager.dart';
import 'package:clashmi/app/modules/zashboard.dart';
import 'package:clashmi/app/runtime/return_result.dart';
import 'package:clashmi/app/utils/backup_and_sync_utils.dart';
import 'package:clashmi/app/utils/file_utils.dart';
import 'package:clashmi/app/utils/path_utils.dart';
import 'package:clashmi/app/utils/platform_utils.dart';
import 'package:clashmi/app/utils/url_launcher_utils.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/backup_and_sync_icloud_screen.dart';
import 'package:clashmi/screens/backup_and_sync_webdav_screen.dart';
import 'package:clashmi/screens/backup_helper.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/file_view_screen.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/group_screen.dart';
import 'package:clashmi/screens/language_settings_screen.dart';
import 'package:clashmi/screens/list_add_screen.dart';
import 'package:clashmi/screens/perapp_android_screen.dart';
import 'package:clashmi/screens/profiles_patch_board_screen.dart';
import 'package:clashmi/screens/theme_define.dart';
import 'package:clashmi/screens/themes.dart';
import 'package:clashmi/screens/version_update_screen.dart';
import 'package:clashmi/screens/webview_helper.dart';
import 'package:clashmi/screens/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupHelper {
  static Future<void> newVersionUpdate(BuildContext context) async {
    AutoUpdateCheckVersion versionCheck = AutoUpdateManager.getVersionCheck();
    if (!versionCheck.newVersion) {
      return;
    }
    var remoteConfig = RemoteConfigManager.getConfig();
    String url = remoteConfig.download.isEmpty
        ? versionCheck.url
        : remoteConfig.download;
    if (AutoUpdateManager.isSupport()) {
      String? installerNew = await AutoUpdateManager.checkReplace();
      if (!context.mounted) {
        return;
      }
      if (installerNew != null) {
        await Navigator.push(
            context,
            MaterialPageRoute(
                settings: VersionUpdateScreen.routSettings(),
                fullscreenDialog: true,
                builder: (context) => const VersionUpdateScreen(force: false)));
      } else {
        await UrlLauncherUtils.loadUrl(url,
            mode: LaunchMode.externalApplication);
      }
    } else {
      await UrlLauncherUtils.loadUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> showBackupAndSync(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final tcontext = Translations.of(context);

      List<GroupItemOptions> options = [
        Platform.isIOS || Platform.isMacOS
            ? GroupItemOptions(
                pushOptions: GroupItemPushOptions(
                    name: tcontext.meta.iCloud,
                    onPush: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              settings:
                                  BackupAndSyncIcloudScreen.routSettings(),
                              builder: (context) =>
                                  const BackupAndSyncIcloudScreen()));
                    }))
            : GroupItemOptions(),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.webdav,
                onPush: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: BackupAndSyncWebdavScreen.routSettings(),
                          builder: (context) =>
                              const BackupAndSyncWebdavScreen()));
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.importAndExport,
                onPush: () async {
                  onTapImportExport(context);
                }))
      ];

      return [
        GroupItem(options: options),
      ];
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("help"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.help,
                  getOptions: getOptions,
                )));
    SettingManager.save();
  }

  static Future<void> onTapImportExport(BuildContext context) async {
    final tcontext = Translations.of(context);

    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      List<GroupItemOptions> options = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.import,
                onPush: () async {
                  onTapImport(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.importFromUrl,
                onPush: () async {
                  onTapImportFromUrl(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.export,
                onPush: () async {
                  onTapExport(context);
                })),
      ];
      return [GroupItem(options: options)];
    }

    if (!context.mounted) {
      return;
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("importAndExport"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.importAndExport,
                  getOptions: getOptions,
                )));
  }

  static Future<void> onTapImport(BuildContext context) async {
    final tcontext = Translations.of(context);
    List<String> extensions = [BackupAndSyncUtils.getZipExtension()];
    try {
      FilePickerResult? pickResult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
      );
      if (!context.mounted) {
        return;
      }
      if (pickResult != null) {
        String filePath = pickResult.files.first.path!;
        String ext = path.extension(filePath).replaceAll('.', '').toLowerCase();
        if (!extensions.contains(ext)) {
          DialogUtils.showAlertDialog(
              context, tcontext.meta.fileTypeInvalid(p: ext));
          return;
        }
        if (!context.mounted) {
          return;
        }
        await BackupHelper.backupRestoreFromZip(context, filePath);
      }
    } catch (err, stacktrace) {
      if (!context.mounted) {
        return;
      }
      DialogUtils.showAlertDialog(context, err.toString(),
          showCopy: true, showFAQ: true, withVersion: true);
    }
  }

  static Future<void> onTapImportFromUrl(BuildContext context) async {
    final tcontext = Translations.of(context);
    String? text = await DialogUtils.showTextInputDialog(
        context, tcontext.meta.url, "", null, null, null, (text) {
      text = text.trim();

      Uri? uri = Uri.tryParse(text);
      if (uri == null || (!uri.isScheme("HTTP") && !uri.isScheme("HTTPS"))) {
        DialogUtils.showAlertDialog(context, tcontext.meta.urlInvalid);
        return false;
      }

      return true;
    });

    if (text != null) {
      if (!context.mounted) {
        return;
      }
      BackupHelper.restoreBackupFromUrl(context, text);
    }
  }

  static Future<void> onTapPortableModeOn(BuildContext context) async {
    Directory? dir;
    bool exist = false;
    bool created = false;
    try {
      String portableProfileDir = PathUtils.profileDirForPortableMode();
      dir = Directory(portableProfileDir);
      exist = await dir.exists();
      if (!exist) {
        await dir.create(recursive: true);
        created = true;
        String profileDir = await PathUtils.profileDir();
        var fileList = Directory(profileDir).listSync(followLinks: false);
        for (var f in fileList) {
          if (f is File) {
            String ext = path.extension(f.path);
            String basename = path.basename(f.path);
            if (ext == ".log") {
              continue;
            }
            var newFilePath = path.join(portableProfileDir, basename);
            await f.copy(newFilePath);
          } else if (f is Directory) {
            String fbasename = path.basename(f.path);
            if (fbasename == "cache" || fbasename == "webviewCache") {
              continue;
            }
            final newDirPath = path.join(portableProfileDir, fbasename);
            var newDir = Directory(newDirPath);
            await newDir.create(recursive: false);
            var fileList = f.listSync(followLinks: false);
            for (var ff in fileList) {
              if (ff is File) {
                String ext = path.extension(ff.path);
                String basename = path.basename(ff.path);
                if (ext == ".log") {
                  continue;
                }
                var newFilePath = path.join(newDirPath, basename);
                await ff.copy(newFilePath);
              }
            }
          }
        }
      }
    } catch (err, stacktrace) {
      if (!exist && created) {
        await dir!.delete();
      }
      if (!context.mounted) {
        return;
      }
      DialogUtils.showAlertDialog(context, err.toString(),
          showCopy: true, showFAQ: true, withVersion: true);
      return;
    }
    await VPNService.uninit();
    await ServicesBinding.instance.exitApplication(AppExitType.required);
  }

  static Future<void> onTapExport(BuildContext context) async {
    try {
      String? filePath;
      if (PlatformUtils.isMobile()) {
        String dir = await PathUtils.cacheDir();
        filePath = path.join(dir, BackupAndSyncUtils.getZipFileName());
      } else {
        filePath = await FilePicker.platform.saveFile(
          fileName: BackupAndSyncUtils.getZipFileName(),
          lockParentWindow: true,
        );
      }

      if (filePath != null) {
        if (!context.mounted) {
          return;
        }
        ReturnResultError? error =
            await BackupHelper.backupToZip(context, filePath);
        if (!context.mounted) {
          FileUtils.deletePath(filePath);
          return;
        }
        if (error != null) {
          DialogUtils.showAlertDialog(context, error.message,
              showCopy: true, showFAQ: true, withVersion: true);
          return;
        }
        if (PlatformUtils.isMobile()) {
          try {
            await Share.shareXFiles([XFile(filePath)]);
          } catch (err) {
            if (!context.mounted) {
              return;
            }
            DialogUtils.showAlertDialog(context, err.toString(),
                showCopy: true, showFAQ: true, withVersion: true);
          }
        }
      }
    } catch (err, stacktrace) {
      if (!context.mounted) {
        return;
      }
      DialogUtils.showAlertDialog(context, err.toString(),
          showCopy: true, showFAQ: true, withVersion: true);
    }
  }

  static Future<void> showHelp(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final tcontext = Translations.of(context);

      List<GroupItemOptions> options = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.download,
                onPush: () async {
                  var remoteConfig = RemoteConfigManager.getConfig();
                  await UrlLauncherUtils.loadUrl(remoteConfig.download,
                      mode: LaunchMode.externalApplication);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.tutorial,
                onPush: () async {
                  var remoteConfig = RemoteConfigManager.getConfig();
                  await WebviewHelper.loadUrl(
                      context, remoteConfig.tutorial, tcontext.meta.tutorial);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.faq,
                onPush: () async {
                  var remoteConfig = RemoteConfigManager.getConfig();
                  await WebviewHelper.loadUrl(
                      context, remoteConfig.faq, tcontext.meta.faq);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: "Telegram",
                onPush: () async {
                  var remoteConfig = RemoteConfigManager.getConfig();
                  await WebviewHelper.loadUrl(
                      context, remoteConfig.telegram, "Telegram");
                })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("help"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.help,
                  getOptions: getOptions,
                )));
    SettingManager.save();
  }

  static Future<void> showAppSettings(BuildContext context) async {
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final tcontext = Translations.of(context);
      var setting = SettingManager.getConfig();
      List<GroupItemOptions> options = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.language,
                icon: Icons.language_outlined,
                text: tcontext.locales[setting.languageTag],
                textWidthPercent: 0.5,
                onPush: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: LanguageSettingsScreen.routSettings(),
                          builder: (context) => const LanguageSettingsScreen(
                              canPop: true, canGoBack: true)));
                })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.meta.theme,
                selected: setting.ui.theme,
                strings: [
                  ThemeDefine.kThemeLight,
                  ThemeDefine.kThemeDark,
                  ThemeDefine.kThemeSystem
                ],
                textWidthPercent: 0.3,
                onPicker: (String? selected) async {
                  if (selected == null) {
                    return;
                  }
                  setting.ui.theme = selected;
                  Provider.of<Themes>(context, listen: false)
                      .setTheme(selected, true);
                })),
        Platform.isAndroid
            ? GroupItemOptions(
                switchOptions: GroupItemSwitchOptions(
                    name: tcontext.meta.tvMode,
                    switchValue: setting.ui.tvMode,
                    onSwitch: (bool value) async {
                      setting.ui.tvMode = value;
                      TextFieldEx.popupEdit = setting.ui.tvMode;
                    }))
            : GroupItemOptions(),
        PlatformUtils.isMobile()
            ? GroupItemOptions(
                switchOptions: GroupItemSwitchOptions(
                    name: tcontext.meta.autoOrientation,
                    switchValue: setting.ui.autoOrientation,
                    onSwitch: (bool value) async {
                      setting.ui.autoOrientation = value;
                      if (value) {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.portraitDown,
                          DeviceOrientation.landscapeRight
                        ]);
                      } else {
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                      }
                    }))
            : GroupItemOptions(),
        AutoUpdateManager.isSupport()
            ? GroupItemOptions(
                stringPickerOptions: GroupItemStringPickerOptions(
                    name: tcontext.meta.updateChannel,
                    selected: setting.autoUpdateChannel,
                    strings: AutoUpdateManager.updateChannels(),
                    textWidthPercent: 0.3,
                    onPicker: (String? selected) async {
                      if (selected == null ||
                          setting.autoUpdateChannel == selected) {
                        return;
                      }
                      setting.autoUpdateChannel = selected;
                      AutoUpdateManager.updateChannelChanged();
                    }))
            : GroupItemOptions(),
      ];
      List<GroupItemOptions> options0 = [
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.userAgent,
                text: setting.userAgent(),
                textWidthPercent: 0.5,
                onChanged: (String value) {
                  setting.setUserAgent(value);
                })),
      ];

      List<GroupItemOptions> options1 = [
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.delayTestUrl,
                text: setting.delayTestUrl,
                textWidthPercent: 0.5,
                onChanged: (String value) {
                  setting.delayTestUrl = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.delayTestTimeout,
                text: setting.delayTestTimeout.toString(),
                textWidthPercent: 0.3,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (String value) {
                  setting.delayTestTimeout = int.tryParse(value) ?? 5000;
                })),
      ];

      List<GroupItemOptions> options2 = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
          name: tcontext.meta.boardOnline,
          switchValue: setting.boardOnline,
          onSwitch: (bool value) async {
            setting.boardOnline = value;
            if (value) {
              Zashboard.stop();
            }
          },
        )),
        setting.boardOnline
            ? GroupItemOptions(
                textFormFieldOptions: GroupItemTextFieldOptions(
                    name: tcontext.meta.boardOnlineUrl,
                    text: setting.boardUrl,
                    textWidthPercent: 0.5,
                    onChanged: (String value) {
                      setting.boardUrl = value;
                    }))
            : GroupItemOptions(),
        !setting.boardOnline
            ? GroupItemOptions(
                textFormFieldOptions: GroupItemTextFieldOptions(
                    name: tcontext.meta.boardLocalPort,
                    text: setting.boardLocalPort.toString(),
                    textWidthPercent: 0.3,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (String value) {
                      setting.boardLocalPort = int.tryParse(value) ??
                          SettingConfig.kDefaultBoardPort;
                    }))
            : GroupItemOptions(),
      ];

      List<GroupItemOptions> options3 = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
          name: tcontext.meta.launchAtStartup,
          switchValue: await VPNService.getLaunchAtStartup(),
          onSwitch: (bool value) async {
            if (!VPNService.isRunAsAdmin()) {
              DialogUtils.showAlertDialog(
                  context, tcontext.meta.launchAtStartupRunAsAdmin,
                  showCopy: true, showFAQ: false, withVersion: true);
              return;
            }
            ReturnResultError? err = await VPNService.setLaunchAtStartup(value);
            if (err != null) {
              if (!context.mounted) {
                return;
              }
              DialogUtils.showAlertDialog(context, err.message,
                  showCopy: true, showFAQ: false, withVersion: true);
            }
          },
        )),
      ];
      List<GroupItemOptions> options4 = [
        Platform.isWindows
            ? GroupItemOptions(
                switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.hideAfterLaunch,
                switchValue: setting.ui.hideAfterLaunch,
                onSwitch: (bool value) async {
                  setting.ui.hideAfterLaunch = value;
                },
              ))
            : GroupItemOptions(),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.autoConnectAfterLaunch,
                switchValue: setting.autoConnectAfterLaunch,
                onSwitch: (bool value) async {
                  setting.autoConnectAfterLaunch = value;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.autoSetSystemProxy,
                switchValue: setting.autoSetSystemProxy,
                onSwitch: (bool value) async {
                  setting.autoSetSystemProxy = value;
                })),
        PlatformUtils.isPC()
            ? GroupItemOptions(
                pushOptions: GroupItemPushOptions(
                    name: tcontext.meta.bypassSystemProxy,
                    onPush: !setting.autoSetSystemProxy
                        ? null
                        : () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings: ListAddScreen.routSettings(
                                        "systemProxyBypassDomain"),
                                    builder: (context) => ListAddScreen(
                                          title:
                                              tcontext.meta.bypassSystemProxy,
                                          data: setting.systemProxyBypassDomain,
                                        )));
                          }))
            : GroupItemOptions(),
      ];
      List<GroupItemOptions> options5 = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
          name: tcontext.meta.portableMode,
          tips: tcontext.meta.portableModeDisableTips,
          switchValue: PathUtils.portableMode(),
          onSwitch: PathUtils.portableMode()
              ? null
              : (bool value) async {
                  if (value) {
                    onTapPortableModeOn(context);
                  }
                },
        )),
      ];
      List<GroupItem> gitems = [
        GroupItem(options: options),
        GroupItem(options: options0),
        GroupItem(options: options1),
        GroupItem(options: options2)
      ];
      if (Platform.isWindows) {
        gitems.add(GroupItem(options: options3));
      }
      if (PlatformUtils.isPC()) {
        gitems.add(GroupItem(options: options4));
      }
      if (Platform.isWindows) {
        gitems.add(GroupItem(options: options5));
      }
      return gitems;
    }

    final tcontext = Translations.of(context);
    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("appSettings"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.settingApp,
                  getOptions: getOptions,
                )));
    SettingManager.save();
  }

  static Future<void> showClashSettings(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      final currentPatch = ProfilePatchManager.getCurrent();
      final remark = currentPatch.getShowName(context);
      var setting = ClashSettingManager.getConfig();
      var extensions = setting.Extension!;
      final logLevels = ClashLogLevel.toList();

      final globalFingerprintsTuple =
          ClashGlobalClientFingerprint.toTupleList(context);

      final ipv6Tuple = BoolToTuple.toTupleList(context);
      final ipv6Selected = BoolToTuple.getSelectedString(context, setting.IPv6);

      final tcpConcurrentTuple = BoolToTuple.toTupleList(context);
      final tcpConcurrentSelected =
          BoolToTuple.getSelectedString(context, setting.TCPConcurrent);

      final started = await VPNService.getStarted();

      List<GroupItemOptions> options = [
        GroupItemOptions(
            textOptions: GroupItemTextOptions(
          name: "",
          text: tcontext.meta.coreSettingTips,
          textColor: Colors.green,
          textWidthPercent: 1,
        )),
      ];
      List<GroupItemOptions> options0 = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.reset,
                onPush: () async {
                  ClashSettingManager.reset();
                  ProfilePatchManager.reset();
                })),
      ];

      List<GroupItemOptions> options1 = [
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.externalController,
                tips: "external-controller",
                text: setting.ExternalController,
                textWidthPercent: 0.5,
                onChanged: (String value) {
                  setting.ExternalController = value;
                })),
        GroupItemOptions(
            textOptions: GroupItemTextOptions(
                name: tcontext.meta.secret,
                tips: "secret",
                text: setting.Secret,
                textWidthPercent: 0.5,
                onPush: () async {
                  try {
                    await Clipboard.setData(
                        ClipboardData(text: setting.Secret ?? ""));
                  } catch (e) {}
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.mixedPort,
                tips: "mixed-port",
                text: setting.MixedPort?.toString() ?? "",
                textWidthPercent: 0.5,
                hint: tcontext.meta.required,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (String value) {
                  setting.MixedPort = int.tryParse(value);
                })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.meta.logLevel,
                tips: "log-level",
                selected: logLevels.contains(setting.LogLevel)
                    ? setting.LogLevel
                    : logLevels.last,
                strings: logLevels,
                onPicker: (String? selected) async {
                  setting.LogLevel = selected;
                })),
        Platform.isAndroid
            ? GroupItemOptions(
                pushOptions: GroupItemPushOptions(
                    name: tcontext.PerAppAndroidScreen.title,
                    onPush: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              settings: PerAppAndroidScreen.routSettings(),
                              builder: (context) =>
                                  const PerAppAndroidScreen()));
                    }))
            : GroupItemOptions(),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "Pprof Address",
                text: extensions.PprofAddr,
                hint: "127.0.0.1:4578",
                textWidthPercent: 0.5,
                onChanged: (String value) {
                  extensions.PprofAddr = value;
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: "Pprof",
                onPush: () async {
                  if (extensions.PprofAddr == null ||
                      extensions.PprofAddr!.isEmpty) {
                    return;
                  }
                  await UrlLauncherUtils.loadUrl(
                      "http://${extensions.PprofAddr}/debug/pprof/");
                })),
      ];

      List<GroupItemOptions> options2 = [
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: "IPv6",
                tips: "ipv6\ndns.ipv6",
                selected: ipv6Selected,
                tupleStrings: ipv6Tuple,
                onPicker: (String? selected) async {
                  setting.IPv6 = BoolToTuple.getSelectedKey(context, selected);
                  setting.DNS?.IPv6 = setting.IPv6;
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.tun,
                tips: "tun",
                onPush: () async {
                  showClashSettingsTUN(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: "Geo RuleSet",
                tips: tcontext.meta.geoRulesetTips,
                onPush: () async {
                  showClashSettingsGEORuleset(context);
                })),
      ];
      List<GroupItemOptions> options3 = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.overwrite,
                text: remark,
                tips: tcontext.meta.overwriteTips,
                textWidthPercent: 0.5,
                onPush: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: ProfilesPatchBoardScreen.routSettings(),
                          builder: (context) => ProfilesPatchBoardScreen()));
                })),
      ];
      List<GroupItem> groups = [];
      if (started) {
        groups.add(GroupItem(options: options));
      }

      groups.addAll([
        GroupItem(options: options0),
        GroupItem(options: options1),
        GroupItem(options: options2),
        GroupItem(options: options3),
      ]);

      List<GroupItemOptions> options4 = [
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.meta.tcpConcurrent,
                tips: "tcp-concurrent",
                selected: tcpConcurrentSelected,
                tupleStrings: tcpConcurrentTuple,
                onPicker: (String? selected) async {
                  setting.TCPConcurrent =
                      BoolToTuple.getSelectedKey(context, selected);
                })),
        GroupItemOptions(
            timerIntervalPickerOptions: GroupItemTimerIntervalPickerOptions(
                name: tcontext.meta.tcpkeepAliveInterval,
                tips:
                    "disable-keep-alive\nkeep-alive-idle\nkeep-alive-interval",
                duration: setting.DisableKeepAlive == true
                    ? null
                    : Duration(seconds: setting.KeepAliveInterval ?? 30),
                showDays: false,
                showHours: false,
                showSeconds: true,
                showMinutes: true,
                showDisable: true,
                onPicker: (bool canceled, Duration? duration) async {
                  if (canceled) {
                    return;
                  }
                  setting.DisableKeepAlive = duration == null;
                  setting.KeepAliveIdle = duration?.inSeconds;
                  setting.KeepAliveInterval = duration?.inSeconds;
                })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.meta.globalClientFingerprint,
                tips: "global-client-fingerprint",
                selected: setting.GlobalClientFingerprint,
                tupleStrings: globalFingerprintsTuple,
                textWidthPercent: 0.3,
                onPicker: (String? selected) async {
                  setting.GlobalClientFingerprint = selected;
                })),
      ];
      List<GroupItemOptions> options5 = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.allowLanAccess,
                onPush: () async {
                  showClashSettingsLanAccess(context);
                })),
      ];

      List<GroupItemOptions> options6 = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.dns,
                tips: "dns",
                onPush: () async {
                  showClashSettingsDNS(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.ntp,
                tips: "ntp",
                onPush: () async {
                  showClashSettingsNTP(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.tls,
                tips: "tls",
                onPush: () async {
                  showClashSettingsTLS(context);
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.meta.sniffer,
                tips: "sniffer",
                onPush: () async {
                  showClashSettingsSniffer(context);
                })),
      ];
      if (currentPatch.id.isEmpty ||
          currentPatch.id == kProfilePatchBuildinOverwrite) {
        groups.addAll([
          GroupItem(options: options4),
          GroupItem(options: options5),
          GroupItem(options: options6),
        ]);
      }

      return groups;
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("coreSettings"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.settingCore,
                  getOptions: getOptions,
                  onDone: (context) async {
                    final currentPatch = ProfilePatchManager.getCurrent();
                    final content = await ClashSettingManager.getPatchContent(
                        currentPatch.id.isEmpty ||
                            currentPatch.id == kProfilePatchBuildinOverwrite);
                    if (!context.mounted) {
                      return false;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            settings: FileViewScreen.routSettings(),
                            builder: (context) => FileViewScreen(
                                  title:
                                      PathUtils.serviceCorePatchFinalFileName(),
                                  content: content,
                                )));

                    return false;
                  },
                  onDoneIcon: Icons.file_present,
                )));
    ClashSettingManager.save();
    ProfilePatchManager.save();
    ProfileManager.save();
  }

  static Future<void> showClashSettingsLanAccess(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();

      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: setting.AllowLan != null,
                onSwitch: (bool value) async {
                  setting.AllowLan = value ? false : null;
                  if (!value) {
                    setting.Authentication = null;
                  }
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.enable,
                tips: "allow-lan",
                switchValue: setting.AllowLan == true,
                onSwitch: setting.AllowLan == null
                    ? null
                    : (bool value) async {
                        setting.AllowLan = value;
                      })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.authentication,
                tips: "authentication",
                text: setting.Authentication?.first,
                hint: "username:password",
                readOnly: setting.AllowLan != true,
                textWidthPercent: 0.5,
                onChanged: setting.AllowLan != true
                    ? null
                    : (String value) {
                        setting.Authentication = value.isEmpty ? null : [value];
                      })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("lanAccess"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.allowLanAccess,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsTUN(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var tun = setting.Tun!;
      var extensions = setting.Extension!;
      final tunStacks = ClashTunStack.toList();
      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: tun.OverWrite,
                onSwitch: (bool value) async {
                  tun.OverWrite = value;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.enable,
                tips: "enable",
                switchValue: tun.Enable,
                onSwitch: tun.OverWrite != true
                    ? null
                    : (bool value) async {
                        tun.Enable = value;
                      })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.tun.stack,
                tips: "stack",
                selected:
                    tunStacks.contains(tun.Stack) ? tun.Stack : tunStacks.first,
                strings: tunStacks,
                onPicker: tun.OverWrite != true || tun.Enable != true
                    ? null
                    : (String? selected) async {
                        tun.Stack = selected;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.tun.dnsHijack,
                tips: "dns-hijack",
                switchValue: tun.DNSHijack?.isNotEmpty,
                onSwitch: tun.OverWrite != true || tun.Enable != true
                    ? null
                    : (bool value) async {
                        tun.DNSHijack =
                            value ? [ClashSettingManager.dnsHijack] : null;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.tun.strictRoute,
                tips: "strict-route",
                switchValue: tun.StrictRoute,
                onSwitch: tun.OverWrite != true || tun.Enable != true
                    ? null
                    : (bool value) async {
                        tun.StrictRoute = value;
                      })),
      ];
      List<GroupItemOptions> options1 = [];
      if (Platform.isAndroid) {
        options1.addAll([
          GroupItemOptions(
              switchOptions: GroupItemSwitchOptions(
                  name: tcontext.tun.allowBypass,
                  switchValue: extensions.Tun.httpProxy.AllowBypass,
                  onSwitch: tun.OverWrite != true || tun.Enable != true
                      ? null
                      : (bool value) async {
                          extensions.Tun.httpProxy.AllowBypass = value;
                        })),
        ]);
      }
      if (Platform.isAndroid || Platform.isIOS) {
        options1.addAll([
          GroupItemOptions(
              switchOptions: GroupItemSwitchOptions(
                  name: tcontext.tun.appendHttpProxy,
                  switchValue: extensions.Tun.httpProxy.Enable,
                  onSwitch: tun.OverWrite != true || tun.Enable != true
                      ? null
                      : (bool value) async {
                          extensions.Tun.httpProxy.Enable = value;
                          extensions.Tun.httpProxy.Server =
                              value ? "127.0.0.1" : null;
                          extensions.Tun.httpProxy.ServerPort =
                              value ? setting.MixedPort : null;
                        })),
          GroupItemOptions(
              pushOptions: GroupItemPushOptions(
                  name: tcontext.tun.bypassHttpProxyDomain,
                  onPush: tun.OverWrite != true || tun.Enable != true
                      ? null
                      : () async {
                          extensions.Tun.httpProxy.BypassDomain ??= [];
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  settings: ListAddScreen.routSettings(
                                      "HttpProxyBypassDomain"),
                                  builder: (context) => ListAddScreen(
                                        title:
                                            tcontext.tun.bypassHttpProxyDomain,
                                        data: extensions
                                            .Tun.httpProxy.BypassDomain!,
                                      )));
                        }))
        ]);
      }

      return [
        GroupItem(options: options),
        GroupItem(options: options1),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("tun"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.tun,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsDNS(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var dns = setting.DNS!;
      final enhancedModes = ClashDnsEnhancedMode.toList();
      final enhancedModesTuple = ClashDnsEnhancedMode.toTupleList();
      final fakeIPFilterModes = ClashFakeIPFilterMode.toList();
      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: dns.OverWrite,
                onSwitch: (bool value) async {
                  dns.OverWrite = value;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.enable,
                tips: "enable",
                switchValue: dns.Enable,
                onSwitch: dns.OverWrite != true
                    ? null
                    : (bool value) async {
                        dns.Enable = value;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.dns.preferH3,
                tips: "prefer-h3",
                switchValue: dns.PreferH3,
                onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                        dns.PreferH3 = value;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.dns.useHosts,
                tips: "use-hosts",
                switchValue: dns.UseHosts,
                onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                        dns.UseHosts = value;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.dns.useSystemHosts,
                tips: "use-system-hosts",
                switchValue: dns.UseSystemHosts,
                onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                        dns.UseSystemHosts = value;
                      })),
        /*   GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: "RespectRules",
              switchValue: dns.RespectRules,
              onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                dns.RespectRules = value;
              }))  ,
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: "DirectNameServerFollowPolicy",
              switchValue: dns.DirectNameServerFollowPolicy,
              onSwitch:dns.OverWrite != true || dns.Enable != true
                    ? null
                    :  (bool value) async {
                dns.DirectNameServerFollowPolicy = value;
              }))  ,*/
      ];
      List<GroupItemOptions> options1 = [
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.dns.enhancedMode,
                tips: "enhanced-mode",
                selected: enhancedModes.contains(dns.EnhancedMode)
                    ? dns.EnhancedMode
                    : enhancedModes.last,
                tupleStrings: enhancedModesTuple,
                onPicker: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (String? selected) async {
                        dns.EnhancedMode = selected;
                      })),
        GroupItemOptions(
            stringPickerOptions: GroupItemStringPickerOptions(
                name: tcontext.dns.fakeIPFilterMode,
                tips: "fake-ip-filter-mode",
                selected: fakeIPFilterModes.contains(dns.FakeIPFilterMode)
                    ? dns.FakeIPFilterMode
                    : fakeIPFilterModes.last,
                strings: fakeIPFilterModes,
                onPicker: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (String? selected) async {
                        dns.FakeIPFilterMode = selected;
                      })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.fakeIPFilter,
                tips: "fake-ip-filter",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.FakeIPFilter ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings:
                                    ListAddScreen.routSettings("FakeIPFilter"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.fakeIPFilter,
                                      data: dns.FakeIPFilter!,
                                    )));
                      })),
      ];
      List<GroupItemOptions> options2 = [
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.defaultNameServer,
                tips: "default-nameserver",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.DefaultNameserver ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: ListAddScreen.routSettings(
                                    "DefaultNameserver"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.defaultNameServer,
                                      data: dns.DefaultNameserver!,
                                    )));
                      })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.nameServer,
                tips: "nameserver",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.NameServer ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings:
                                    ListAddScreen.routSettings("NameServer"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.nameServer,
                                      data: dns.NameServer!,
                                    )));
                      })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.proxyNameServer,
                tips: "proxy-server-nameserver",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.ProxyServerNameserver ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: ListAddScreen.routSettings(
                                    "ProxyServerNameserver"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.proxyNameServer,
                                      data: dns.ProxyServerNameserver!,
                                    )));
                      })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.directNameServer,
                tips: "direct-nameserver",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.DirectNameServer ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: ListAddScreen.routSettings(
                                    "DirectNameServer"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.directNameServer,
                                      data: dns.DirectNameServer!,
                                    )));
                      })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.dns.fallbackNameServer,
                tips: "fallback",
                onPush: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : () async {
                        dns.Fallback ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings:
                                    ListAddScreen.routSettings("Fallback"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.dns.fallbackNameServer,
                                      data: dns.Fallback!,
                                    )));
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.dns.fallbackGeoIp,
                tips: "geoip",
                switchValue: dns.FallbackFilter?.GeoIP,
                onSwitch: dns.OverWrite != true || dns.Enable != true
                    ? null
                    : (bool value) async {
                        dns.FallbackFilter ??= RawFallbackFilter.by();
                        dns.FallbackFilter?.GeoIP = value;
                      })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.dns.fallbackGeoIpCode,
                text: dns.FallbackFilter?.GeoIPCode,
                textWidthPercent: 0.5,
                readOnly: dns.OverWrite != true || dns.Enable != true,
                tips: "geoip-code",
                onChanged: (String value) {
                  dns.FallbackFilter ??= RawFallbackFilter.by();
                  dns.FallbackFilter?.GeoIPCode = value;
                })),
      ];

      return [
        GroupItem(options: options),
        GroupItem(options: options1),
        GroupItem(options: options2),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("dns"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.dns,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsNTP(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var ntp = setting.NTP!;
      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: ntp.OverWrite,
                onSwitch: (bool value) async {
                  ntp.OverWrite = value;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.enable,
                switchValue: ntp.Enable,
                tips: "enable",
                onSwitch: ntp.OverWrite != true
                    ? null
                    : (bool value) async {
                        ntp.Enable = value;
                      })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.server,
                tips: "server",
                text: ntp.Server,
                textWidthPercent: 0.5,
                hint: tcontext.meta.required,
                readOnly: ntp.OverWrite != true || ntp.Enable != true,
                onChanged: (String value) {
                  ntp.Server = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.meta.port,
                tips: "port",
                text: ntp.Port?.toString() ?? "",
                textWidthPercent: 0.5,
                hint: tcontext.meta.required,
                readOnly: ntp.OverWrite != true || ntp.Enable != true,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (String value) {
                  ntp.Port = int.tryParse(value);
                })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("ntp"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.ntp,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsTLS(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var tls = setting.TLS!;
      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: tls.OverWrite,
                onSwitch: (bool value) async {
                  tls.OverWrite = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.tls.certificate,
                tips: "certificate",
                text: tls.Certificate,
                textWidthPercent: 0.5,
                readOnly: tls.OverWrite != true,
                onChanged: (String value) {
                  tls.Certificate = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: tcontext.tls.privateKey,
                tips: "private-key",
                text: tls.PrivateKey,
                textWidthPercent: 0.5,
                readOnly: tls.OverWrite != true,
                onChanged: (String value) {
                  tls.PrivateKey = value;
                })),
        GroupItemOptions(
            pushOptions: GroupItemPushOptions(
                name: tcontext.tls.customTrustCert,
                tips: "custom-certifactes",
                onPush: tls.OverWrite != true
                    ? null
                    : () async {
                        tls.CustomTrustCert ??= [];
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: ListAddScreen.routSettings(
                                    "CustomTrustCert"),
                                builder: (context) => ListAddScreen(
                                      title: tcontext.tls.customTrustCert,
                                      data: tls.CustomTrustCert!,
                                    )));
                      })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("tls"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.tls,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsSniffer(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var sniffer = setting.Sniffer!;
      List<GroupItemOptions> options = [
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.overwrite,
                switchValue: sniffer.OverWrite,
                onSwitch: (bool value) async {
                  sniffer.OverWrite = value;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.enable,
                tips: "enable",
                switchValue: sniffer.Enable,
                onSwitch: sniffer.OverWrite != true
                    ? null
                    : (bool value) async {
                        sniffer.Enable = value;
                      })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.sniffer.overrideDest,
                tips: "override-destination",
                switchValue: sniffer.OverrideDest,
                onSwitch: sniffer.OverWrite != true || sniffer.Enable != true
                    ? null
                    : (bool value) async {
                        sniffer.OverrideDest = value;
                      })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("sniffer"),
            builder: (context) => GroupScreen(
                  title: tcontext.meta.sniffer,
                  getOptions: getOptions,
                )));
  }

  static Future<void> showClashSettingsGEORuleset(BuildContext context) async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
        BuildContext context, SetStateCallback? setstate) async {
      var setting = ClashSettingManager.getConfig();
      var ruleset = setting.Extension!.Ruleset;
      List<GroupItemOptions> options = [
        GroupItemOptions(
            timerIntervalPickerOptions: GroupItemTimerIntervalPickerOptions(
                name: tcontext.meta.updateInterval,
                duration:
                    Duration(seconds: ruleset.UpdateInterval ?? 2 * 24 * 3600),
                showMinutes: false,
                showSeconds: false,
                showDisable: false,
                onPicker: (bool canceled, Duration? duration) async {
                  if (canceled) {
                    return;
                  }
                  if (duration == null) {
                    return;
                  }
                  ruleset.UpdateInterval = duration.inSeconds;
                })),
        GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
                name: tcontext.meta.geoDownloadByProxy,
                switchValue: ruleset.EnableProxy,
                onSwitch: ruleset.UpdateInterval == null
                    ? null
                    : (bool value) async {
                        ruleset.EnableProxy = value;
                      })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "GeoSite",
                text: ruleset.GeoSiteUrl,
                textWidthPercent: 0.6,
                onChanged: (String value) {
                  ruleset.GeoSiteUrl = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "GeoIp",
                text: ruleset.GeoIpUrl,
                textWidthPercent: 0.6,
                onChanged: (String value) {
                  ruleset.GeoIpUrl = value;
                })),
        GroupItemOptions(
            textFormFieldOptions: GroupItemTextFieldOptions(
                name: "ASN",
                text: ruleset.AsnUrl,
                textWidthPercent: 0.6,
                onChanged: (String value) {
                  ruleset.AsnUrl = value;
                })),
      ];

      return [
        GroupItem(options: options),
      ];
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            settings: GroupScreen.routSettings("geo"),
            builder: (context) => GroupScreen(
                  title: "Geo RuleSet",
                  getOptions: getOptions,
                )));
  }
}
