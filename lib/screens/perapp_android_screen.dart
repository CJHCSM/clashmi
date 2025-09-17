// ignore_for_file: unused_catch_stack

import 'package:android_package_manager/android_package_manager.dart';
import 'package:app_settings/app_settings.dart';
import 'package:clashmi/app/modules/clash_setting_manager.dart';
import 'package:clashmi/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clashmi/app/modules/setting_manager.dart';
import 'package:clashmi/app/utils/app_utils.dart';
import 'package:clashmi/i18n/strings.g.dart';

import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/theme_define.dart';
import 'package:clashmi/screens/widgets/framework.dart';

class PerAppAndroidScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "PerAppAndroidScreen");
  }

  const PerAppAndroidScreen({super.key});

  @override
  State<PerAppAndroidScreen> createState() => _PerAppAndroidScreenState();
}

class PackageInfoImpl extends PackageInfo {
  PackageInfoImpl(
    String packageName,
  ) : super(
            packageName: packageName,
            installLocation: AndroidInstallLocation.unspecified);
}

class PackageInfoEx {
  late PackageInfo info;
  String name = "";
  Image? icon;
}

class _PerAppAndroidScreenState
    extends LasyRenderingState<PerAppAndroidScreen> {
  //https://github.com/ekoputrapratama/flutter_android_native/blob/6dacb8a0bcc9c8c05159eb916b2f0bea9db60826/lib/content/pm/ApplicationInfo.dart#L14
  static const int FLAG_SYSTEM = 1;
  static const _removed = "[removed]";
  AndroidPackageManager? _pkgMgr;
  bool _loading = true;
  final List<PackageInfoEx> _applicationInfoList = [];
  final _searchController = TextEditingController();
  List<PackageInfoEx> _searchedData = [];
  bool _needPermission = false;

  @override
  void initState() {
    _loading = true;
    getInstalledPackages();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ClashSettingManager.save();
    SettingManager.save();
  }

  _loadSearch(String? textVal) {
    if ((textVal != null) && textVal.isNotEmpty) {
      String search = textVal.toLowerCase();
      final data = _applicationInfoList.where((app) {
        String name = app.name.toLowerCase();
        String pkgName = app.info.packageName!.toLowerCase();
        return name.contains(search) || pkgName.contains(search);
      }).toList();
      _searchedData = data;
      setState(() {});
    } else {
      _searchedData = _applicationInfoList;
      setState(() {});
    }
  }

  _clearSearch() {
    _searchController.clear();
    _searchedData = _applicationInfoList;
    setState(() {});
  }

  Future<void> getInstalledPackages() async {
    _applicationInfoList.clear();
    _searchedData.clear();
    _pkgMgr ??= AndroidPackageManager();
    _pkgMgr!
        .getInstalledPackages(
      flags: PackageInfoFlags(
        {
          PMFlag.getMetaData,
        },
      ),
    )
        .then((value) async {
      if (!mounted) {
        return;
      }
      _loading = false;
      if (value == null) {
        return;
      }

      if (value.length <= 1) {
        _needPermission = true;
        _loading = false;
        setState(() {});
        return;
      }
      List<PackageInfoEx> notExists = [];
      List<PackageInfoEx> added = [];
      List<PackageInfoEx> notAdded = [];
      Set<String> exists = {};
      Set<String> existsSystem = {};
      final settings = SettingManager.getConfig();
      var perapp = ClashSettingManager.getConfig().Extension!.Tun.perApp;
      for (var app in value) {
        if (app.packageName == null || app.packageName == AppUtils.getId()) {
          continue;
        }

        if (settings.ui.perAppHideSystemApp) {
          if ((app.applicationInfo != null) &&
              (app.applicationInfo!.flags & FLAG_SYSTEM != 0)) {
            existsSystem.add(app.packageName!);
            continue;
          }
        }

        exists.add(app.packageName!);
        PackageInfoEx info = PackageInfoEx();
        info.info = app;
        info.name = await getAppName(app.packageName!);
        if (info.name.contains("{") &&
            info.name.contains(":") &&
            info.name.contains("\"")) {
          continue;
        }
        if (!mounted) {
          return;
        }
        if (perapp.PackageIds != null &&
            perapp.PackageIds!.contains(info.info.packageName!)) {
          added.add(info);
        } else {
          notAdded.add(info);
        }
      }
      if (perapp.PackageIds != null) {
        for (var papp in perapp.PackageIds!) {
          if (!exists.contains(papp) && !existsSystem.contains(papp)) {
            PackageInfoEx info = PackageInfoEx();
            info.info = PackageInfoImpl(papp);
            info.name = _removed;
            info.icon = null;

            notExists.add(info);
          }
        }
      }

      notExists.sort(sort);
      added.sort(sort);
      notAdded.sort(sort);
      _applicationInfoList.addAll(notExists);
      _applicationInfoList.addAll(added);
      _applicationInfoList.addAll(notAdded);

      _searchedData = _applicationInfoList;
      _loading = false;
      setState(() {});
    });
  }

  Future<Image?> getInstalledPackageIcon(String packageName) async {
    if (SettingManager.getConfig().ui.perAppHideAppIcon) {
      return null;
    }
    for (var app in _applicationInfoList) {
      if (app.info.packageName == packageName) {
        if (app.icon != null) {
          return app.icon;
        }
        if (app.name == _removed) {
          return null;
        }
        Image? image = await getAppIcon(app.info.packageName);
        if (!mounted) {
          return null;
        }
        app.icon = image;
        return app.icon;
      }
    }
    return null;
  }

  int sort(PackageInfoEx a, PackageInfoEx b) {
    return a.name.compareTo(b.name);
  }

  Future<String> getAppName(String? packageName) async {
    if (_pkgMgr == null || packageName == null) {
      return "";
    }
    try {
      return await _pkgMgr!.getApplicationLabel(packageName: packageName) ?? "";
    } catch (err, stacktrace) {
      return packageName;
    }
  }

  Future<Image?> getAppIcon(String? packageName) async {
    if (SettingManager.getConfig().ui.perAppHideAppIcon) {
      return null;
    }
    if (_pkgMgr == null || packageName == null) {
      return null;
    }
    try {
      var data = await _pkgMgr!.getApplicationIcon(
          packageName: packageName, format: BitmapCompressFormat.png);
      if (data == null) {
        return null;
      }
      return Image.memory(
        data,
        cacheHeight: 96,
        cacheWidth: 96,
      );
    } catch (err, stacktrace) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    Size windowSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const SizedBox(
                        width: 50,
                        height: 30,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 26,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: windowSize.width - 50 * 2,
                      child: Text(
                        tcontext.PerAppAndroidScreen.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: ThemeConfig.kFontWeightTitle,
                            fontSize: ThemeConfig.kFontSizeTitle),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        onTapMore();
                      },
                      child: Tooltip(
                        message: tcontext.meta.more,
                        child: const SizedBox(
                            width: 50,
                            height: 30,
                            child: Icon(
                              Icons.more_vert_outlined,
                              size: 30,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: getGroupOptions(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<GroupItem>> snapshot) {
                  List<GroupItem> data = snapshot.hasData ? snapshot.data! : [];
                  return Column(
                      children: GroupItemCreator.createGroups(context, data));
                },
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 44,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: ThemeDefine.kBorderRadius,
                ),
                child: TextFieldEx(
                  controller: _searchController,
                  textInputAction: TextInputAction.done,
                  onChanged: _loadSearch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search_outlined,
                    ),
                    hintText: tcontext.meta.search,
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            onPressed: _clearSearch,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: _needPermission
                    ? createNeedPermission(
                        context,
                        tcontext.permission
                            .request(p: tcontext.permission.appQuery), () {
                        AppSettings.openAppSettings(
                            type: AppSettingsType.settings);
                      }, () {
                        _needPermission = false;
                        _loading = true;
                        getInstalledPackages();
                        setState(() {});
                      })
                    : _loadListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadListView() {
    if (_loading) {
      return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 26,
              height: 26,
              child: RepaintBoundary(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          ]);
    }
    Size windowSize = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: _searchedData.length,
      itemBuilder: (BuildContext context, int index) {
        PackageInfoEx current = _searchedData[index];
        return createWidget(current, windowSize);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
          thickness: 0.3,
        );
      },
    );
  }

  Widget createWidget(PackageInfoEx current, Size windowSize) {
    var perapp = ClashSettingManager.getConfig().Extension!.Tun.perApp;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Material(
        borderRadius: ThemeDefine.kBorderRadius,
        child: InkWell(
          onTap: () {
            bool value = perapp.PackageIds != null &&
                perapp.PackageIds!.contains(current.info.packageName!);
            if (value != true) {
              perapp.PackageIds!.add(current.info.packageName!);
            } else {
              perapp.PackageIds!.remove(current.info.packageName!);
            }

            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: double.infinity,
            height: 66,
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: FutureBuilder(
                              future: getInstalledPackageIcon(
                                  current.info.packageName!),
                              builder: (BuildContext context,
                                  AsyncSnapshot<Image?> snapshot) {
                                if (!snapshot.hasData ||
                                    snapshot.data == null) {
                                  return const SizedBox.shrink();
                                }
                                return SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: snapshot.data);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: windowSize.width - 140,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    current.name,
                                    style: TextStyle(
                                        fontSize:
                                            ThemeConfig.kFontSizeGroupItem),
                                  ),
                                  current.name == current.info.packageName
                                      ? const SizedBox.shrink()
                                      : Text(
                                          current.info.packageName!,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                ]),
                          ),
                          Checkbox(
                            tristate: true,
                            value: perapp.PackageIds != null &&
                                perapp.PackageIds!
                                    .contains(current.info.packageName!),
                            onChanged: (bool? value) {
                              perapp.PackageIds ??= [];
                              if (value == true) {
                                perapp.PackageIds!
                                    .add(current.info.packageName!);
                              } else {
                                perapp.PackageIds!
                                    .remove(current.info.packageName!);
                              }

                              setState(() {});
                            },
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<GroupItem>> getGroupOptions() async {
    var perapp = ClashSettingManager.getConfig().Extension!.Tun.perApp;
    final tcontext = Translations.of(context);

    List<GroupItemOptions> options = [
      GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.enable,
              switchValue: perapp.Enable,
              onSwitch: (bool value) async {
                perapp.Enable = value;

                setState(() {});
              })),
      GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: tcontext.PerAppAndroidScreen.whiteListMode,
              switchValue: perapp.WhiteList,
              tips: tcontext.PerAppAndroidScreen.whiteListModeTip,
              onSwitch: (bool value) async {
                perapp.WhiteList = value;

                setState(() {});
              })),
      GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.hideSystemApp,
              switchValue: SettingManager.getConfig().ui.perAppHideSystemApp,
              onSwitch: (bool value) async {
                SettingManager.getConfig().ui.perAppHideSystemApp = value;
                _loading = true;
                getInstalledPackages();
                setState(() {});
              })),
      GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
              name: tcontext.meta.hideAppIcon,
              switchValue: SettingManager.getConfig().ui.perAppHideAppIcon,
              onSwitch: (bool value) async {
                SettingManager.getConfig().ui.perAppHideAppIcon = value;
                setState(() {});
              })),
    ];

    return [GroupItem(options: options)];
  }

  void onTapMore() {
    var perapp = ClashSettingManager.getConfig().Extension!.Tun.perApp;
    final tcontext = Translations.of(context);
    showMenu(
        context: context,
        position: const RelativeRect.fromLTRB(0.1, 0, 0, 0),
        items: [
          PopupMenuItem(
              value: 1,
              child: SizedBox(
                height: 30,
                child: Text(
                  tcontext.meta.importFromClipboard,
                  style: const TextStyle(
                      fontWeight: ThemeConfig.kFontWeightTitle,
                      fontSize: ThemeConfig.kFontSizeTitle),
                ),
              ),
              onTap: () async {
                perapp.PackageIds ??= [];
                try {
                  ClipboardData? data = await Clipboard.getData("text/plain");
                  if (data == null || data.text == null || data.text!.isEmpty) {
                    return;
                  }
                  List<String> list = data.text!.split("\n");
                  if (list.isEmpty) {
                    return;
                  }
                  for (var app in list) {
                    app = app.trim();
                    if (perapp.PackageIds!.contains(app)) {
                      continue;
                    }

                    perapp.PackageIds!.add(app);
                  }
                  setState(() {});
                } catch (err) {
                  if (!mounted) {
                    return;
                  }
                  DialogUtils.showAlertDialog(context, err.toString(),
                      showCopy: true, showFAQ: true, withVersion: true);
                }
              }),
          PopupMenuItem(
            value: 1,
            child: SizedBox(
              height: 30,
              child: Text(
                tcontext.meta.exportToClipboard,
                style: const TextStyle(
                    fontWeight: ThemeConfig.kFontWeightTitle,
                    fontSize: ThemeConfig.kFontSizeTitle),
              ),
            ),
            onTap: () async {
              perapp.PackageIds ??= [];
              try {
                if (perapp.PackageIds!.isEmpty) {
                  return;
                }
                String content = perapp.PackageIds!.join("\n");
                await Clipboard.setData(ClipboardData(text: content));
                if (!mounted) {
                  return;
                }
              } catch (err) {
                if (!mounted) {
                  return;
                }
                DialogUtils.showAlertDialog(context, err.toString(),
                    showCopy: true, showFAQ: true, withVersion: true);
              }
            },
          ),
        ]);
  }

  Widget createNeedPermission(BuildContext context, String text,
      Function() onPermission, Function() onRefresh) {
    final tcontext = Translations.of(context);
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              child: Text(text),
              onPressed: () async {
                onPermission();
              }),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              child: Text(tcontext.meta.refresh),
              onPressed: () async {
                onRefresh();
              }),
        ],
      ),
    );
  }
}
