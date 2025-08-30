import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:clashmi/app/modules/profile_manager.dart';
import 'package:clashmi/app/modules/remote_config_manager.dart';
import 'package:clashmi/app/utils/url_launcher_utils.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/add_profile_by_import_from_file_screen.dart';
import 'package:clashmi/screens/add_profile_by_scan_qrcode_screen.dart';
import 'package:clashmi/screens/add_profile_by_url_screen.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/profiles_board_screen_widgets.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/webview_helper.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:clashmi/screens/widgets/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilesBoardScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "/");
  }

  final bool navigateToAdd;
  const ProfilesBoardScreen({super.key, this.navigateToAdd = false});

  @override
  State<ProfilesBoardScreen> createState() => _ProfilesBoardScreenState();
}

class _ProfilesBoardScreenState extends LasyRenderingState<ProfilesBoardScreen>
    with WidgetsBindingObserver, AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    ProfileManager.onEventAdd.add(_onAdd);
    ProfileManager.onEventRemove.add(_onRemove);
    ProfileManager.onEventUpdate.add(_onUpdate);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    if (widget.navigateToAdd) {
      onTapAdd();
    }
  }

  @override
  void dispose() {
    ProfileManager.onEventAdd.remove(_onAdd);
    ProfileManager.onEventRemove.remove(_onRemove);
    ProfileManager.onEventUpdate.remove(_onUpdate);
    super.dispose();
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
              Row(
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
                    width: windowSize.width - 50 * 3,
                    child: Text(
                      tcontext.meta.myProfiles,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: ThemeConfig.kFontWeightTitle,
                          fontSize: ThemeConfig.kFontSizeTitle),
                    ),
                  ),
                  ProfileManager.updating.isNotEmpty
                      ? const Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: RepaintBoundary(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () async {
                            onTapUpdateAll();
                          },
                          child: Tooltip(
                              message: tcontext.meta.update,
                              child: const SizedBox(
                                width: 50,
                                height: 30,
                                child: Icon(
                                  Icons.cloud_download_outlined,
                                  size: 30,
                                ),
                              )),
                        ),
                  InkWell(
                    onTap: () async {
                      onTapAdd();
                    },
                    child: Tooltip(
                        message: tcontext.meta.add,
                        child: const SizedBox(
                          width: 50,
                          height: 30,
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: FutureBuilder(
                    future: getProfiles(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProfileSetting>> snapshot) {
                      List<ProfileSetting> data =
                          snapshot.hasData ? snapshot.data! : [];
                      return ProfilesBoardScreenWidget(settings: data);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ProfileSetting>> getProfiles() async {
    return ProfileManager.getProfiles();
  }

  void onTapUpdateAll() async {
    await ProfileManager.updateAll();
  }

  void onTapAdd() async {
    final tcontext = Translations.of(context);
    var widgets = [
      ListTile(
        title: Text(tcontext.meta.getProfile),
        onTap: () async {
          Navigator.of(context).pop();
          var remoteConfig = RemoteConfigManager.getConfig();

          String url = remoteConfig.getTranffic;

          url = await UrlLauncherUtils.reorganizationUrlWithAnchor(url);

          if (!mounted) {
            return;
          }
          await WebviewHelper.loadUrl(context, url, "getTranffic",
              title: tcontext.meta.getProfile);
        },
      ),
      ListTile(
        title: Text(tcontext.meta.profileAddUrlOrContent),
        onTap: () async {
          Navigator.of(context).pop();
          await Navigator.push(
              context,
              MaterialPageRoute(
                  settings: AddProfileByUrlScreen.routSettings(),
                  builder: (context) => AddProfileByUrlScreen()));
        },
      ),
      ListTile(
        title: Text(tcontext.meta.importFromClipboard),
        onTap: () async {
          Navigator.of(context).pop();
          ClipboardData? data;
          try {
            data = await Clipboard.getData("text/plain");
          } catch (err) {
            if (!mounted) {
              return;
            }
            DialogUtils.showAlertDialog(context, err.toString(),
                showCopy: true, showFAQ: true, withVersion: true);
            return;
          }
          if (!mounted) {
            return;
          }
          if (data == null || data.text == null || data.text!.isEmpty) {
            return;
          }
          await Navigator.push(
              context,
              MaterialPageRoute(
                  settings: AddProfileByUrlScreen.routSettings(),
                  builder: (context) =>
                      AddProfileByUrlScreen(url: data!.text!)));
        },
      ),
      ListTile(
        title: Text(tcontext.meta.qrcodeScan),
        onTap: () async {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  settings: AddProfileByScanQrcodeScanScreen.routSettings(),
                  builder: (context) =>
                      const AddProfileByScanQrcodeScanScreen())).then((value) {
            if ((value != null) && (value.qrcode != null)) {
              if (!mounted) {
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: AddProfileByUrlScreen.routSettings(),
                      builder: (context) =>
                          AddProfileByUrlScreen(url: value.qrcode!)));
            }
          });
        },
      ),
      ListTile(
        title: Text(tcontext.meta.profileImport),
        onTap: () async {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  settings: AddProfileByImportFromFileScreen.routSettings(),
                  builder: (context) =>
                      const AddProfileByImportFromFileScreen()));
        },
      ),
    ];

    showSheet(
      context: context,
      body: SizedBox(
          height: 400,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Scrollbar(
                child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return widgets[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                  thickness: 0.3,
                );
              },
              itemCount: widgets.length,
            )),
          )),
    );
  }

  Future<void> _onAdd(String id) async {
    setState(() {});
  }

  Future<void> _onRemove(String id) async {
    setState(() {});
  }

  Future<void> _onUpdate(String id, bool finish) async {
    setState(() {});
  }
}
