import 'package:clashmi/app/clash/clash_http_api.dart';
import 'package:clashmi/app/local_services/vpn_service.dart';
import 'package:clashmi/app/modules/diversion_template_manager.dart';
import 'package:clashmi/app/modules/profile_manager.dart';
import 'package:clashmi/app/modules/profile_patch_manager.dart';
import 'package:clashmi/app/modules/setting_manager.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/group_screen.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/theme_define.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:clashmi/screens/widgets/sheet.dart';
import 'package:clashmi/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class ProfilesSettingsEditScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return const RouteSettings(name: "ProfilesSettingsEditScreen");
  }

  final String profileid;
  const ProfilesSettingsEditScreen({super.key, required this.profileid});

  @override
  State<ProfilesSettingsEditScreen> createState() =>
      _ProfilesSettingsEditScreenState();
}

class _ProfilesSettingsEditScreenState
    extends LasyRenderingState<ProfilesSettingsEditScreen> {
  final _textControllerRemark = TextEditingController();
  final _textControllerUrl = TextEditingController();
  late ProfileSetting _profile;
  List<ClashProxiesNode> _nodes = [];

  @override
  void initState() {
    final exist = ProfileManager.getProfile(widget.profileid);
    if (exist != null) {
      _profile = exist.clone();
    } else {
      _profile = ProfileSetting(updateInterval: const Duration(hours: 24));
    }

    _profile.userAgent = _profile.userAgent.isEmpty
        ? SettingManager.getConfig().userAgent()
        : _profile.userAgent;

    _textControllerRemark.value = _textControllerRemark.value.copyWith(
      text: _profile.remark,
    );
    _textControllerUrl.value = _textControllerUrl.value.copyWith(
      text: _profile.url,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tcontext = Translations.of(context);
    Size windowSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.zero, child: AppBar()),
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
                      child: Icon(Icons.arrow_back_ios_outlined, size: 26),
                    ),
                  ),
                  SizedBox(
                    width: windowSize.width - 50 * 2,
                    child: Text(
                      tcontext.meta.profileEdit,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: ThemeConfig.kFontWeightTitle,
                        fontSize: ThemeConfig.kFontSizeTitle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onTapSave();
                    },
                    child: const SizedBox(
                      width: 50,
                      height: 30,
                      child: Icon(Icons.done_outlined, size: 26),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                        child: Column(
                          children: [
                            TextFieldEx(
                              controller: _textControllerRemark,
                              textInputAction: _profile.isRemote()
                                  ? TextInputAction.next
                                  : TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: tcontext.meta.remark,
                                hintText: tcontext.meta.remark,
                              ),
                            ),
                            _profile.isRemote()
                                ? const SizedBox(height: 20)
                                : const SizedBox.shrink(),
                            _profile.isRemote()
                                ? TextFieldEx(
                                    maxLines: 4,
                                    controller: _textControllerUrl,
                                    decoration: InputDecoration(
                                      labelText: tcontext.meta.url,
                                      hintText: tcontext.meta.url,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: 20),
                            FutureBuilder(
                              future: getGroupOptions(),
                              builder:
                                  (
                                    BuildContext context,
                                    AsyncSnapshot<List<GroupItem>> snapshot,
                                  ) {
                                    List<GroupItem> data = snapshot.hasData
                                        ? snapshot.data!
                                        : [];
                                    return Column(
                                      children: GroupItemCreator.createGroups(
                                        context,
                                        data,
                                      ),
                                    );
                                  },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSave() {
    String remarkText = _textControllerRemark.text.trim();
    String urlText = _textControllerUrl.text.trim();
    if (_profile.updateInterval != null) {
      if (_profile.updateInterval!.inMinutes < 5) {
        _profile.updateInterval = const Duration(minutes: 5);
      }
    }

    final err = checkUrl(_profile.url, urlText);
    if (err != null) {
      DialogUtils.showAlertDialog(context, err);
      return;
    }
    _profile.remark = remarkText;
    _profile.url = urlText;

    ProfileManager.updateProfile(_profile.id, _profile);
    ProfileManager.save();
    Navigator.pop(context);
  }

  String? checkUrl(String oldUrl, String url) {
    final tcontext = Translations.of(context);
    if (oldUrl == url) {
      return null;
    }
    Uri? uri = Uri.tryParse(url);
    if (uri == null || (uri.scheme != 'http' && uri.scheme != 'https')) {
      return tcontext.meta.urlInvalid;
    }

    return null;
  }

  Future<List<GroupItem>> getGroupOptions() async {
    final tcontext = Translations.of(context);
    final currentPatch = ProfilePatchManager.getCurrent();
    String currentSelectedAppend = "";
    if (currentPatch.id == kProfilePatchBuildinOverwrite) {
      currentSelectedAppend = "(${tcontext.profilePatchMode.overwrite})";
    } else if (currentPatch.id == kProfilePatchBuildinNoOverwrite) {
      currentSelectedAppend = "(${tcontext.profilePatchMode.noOverwrite})";
    } else {
      currentSelectedAppend = "(${currentPatch.remark})";
    }
    List<Tuple2<String?, String>> overwrite = [
      Tuple2(
        "",
        "${tcontext.profilePatchMode.currentSelected}$currentSelectedAppend",
      ),
      Tuple2(
        kProfilePatchBuildinOverwrite,
        tcontext.profilePatchMode.overwrite,
      ),
      Tuple2(
        kProfilePatchBuildinNoOverwrite,
        tcontext.profilePatchMode.noOverwrite,
      ),
    ];
    final items = ProfilePatchManager.getProfilePatchs();
    for (var item in items) {
      overwrite.add(Tuple2(item.id, item.id));
    }
    List<GroupItem> groupOptions = [];
    List<GroupItemOptions> options = [
      GroupItemOptions(
        textFormFieldOptions: GroupItemTextFieldOptions(
          name: tcontext.meta.userAgent,
          text: _profile.userAgent,
          textWidthPercent: 0.6,
          onChanged: (String value) {
            _profile.userAgent = value;
          },
        ),
      ),
      GroupItemOptions(
        stringPickerOptions: GroupItemStringPickerOptions(
          name: tcontext.meta.coreOverwrite,
          selected: _profile.patch,
          tupleStrings: overwrite,
          onPicker: (String? selected) async {
            _profile.patch = selected ?? "";
            setState(() {});
          },
        ),
      ),
      if (_profile.isRemote()) ...[
        GroupItemOptions(
          timerIntervalPickerOptions: GroupItemTimerIntervalPickerOptions(
            name: tcontext.meta.updateInterval,
            tips: tcontext.meta.updateInterval5mTips,
            duration: _profile.updateInterval,
            showSeconds: false,
            onPicker: (bool canceled, Duration? duration) async {
              if (canceled) {
                return;
              }
              if (duration != null) {
                if (duration.inDays > 365) {
                  duration = const Duration(days: 365);
                }
                if (duration.inMinutes < 5) {
                  duration = const Duration(minutes: 5);
                }
              }

              _profile.updateInterval = duration;
              setState(() {});
            },
          ),
        ),
      ],
    ];

    List<GroupItemOptions> options1 = [
      GroupItemOptions(
        pushOptions: GroupItemPushOptions(
          name: tcontext.meta.rule,
          tips: "rules",
          onPush: () async {
            showClashSettingsRules();
          },
        ),
      ),
    ];

    groupOptions.add(GroupItem(options: options));
    groupOptions.add(GroupItem(options: options1));

    return groupOptions;
  }

  Future<void> showClashSettingsRules() async {
    final tcontext = Translations.of(context);
    Future<List<GroupItem>> getOptions(
      BuildContext context,
      SetStateCallback? setstate,
    ) async {
      List<GroupItemOptions> options = [
        GroupItemOptions(
          switchOptions: GroupItemSwitchOptions(
            name: tcontext.meta.overwrite,
            switchValue: _profile.overwriteRules,
            onSwitch: (bool value) async {
              _profile.overwriteRules = value;
              setState(() {});
            },
          ),
        ),
      ];
      List<GroupItemOptions> options1 = [];
      final names = DiversionTemplateManager.getRuleTemplatesNames();
      for (var name in names) {
        final target = _profile.rules[name];
        options1.add(
          GroupItemOptions(
            pushOptions: GroupItemPushOptions(
              name: name,
              text: target,
              onPush: () async {
                final connected = await VPNService.getStarted();
                if (!context.mounted) {
                  return;
                }
                if (!connected) {
                  DialogUtils.showAlertDialog(
                    context,
                    "Please open the connection before trying again.",
                  );
                  return;
                }
                if (_nodes.isEmpty) {
                  _nodes = await getProxies();
                }
                var widgets = [];
                for (var node in _nodes) {
                  widgets.add(
                    ListTile(
                      title: Text(node.name),
                      subtitle: Text(node.type),
                      selected: node.name == _profile.rules[name],
                      selectedColor: ThemeDefine.kColorBlue,
                      onTap: () async {
                        _profile.rules[name] = node.name;
                        Navigator.of(context).pop();
                        setstate?.call();
                      },
                    ),
                  );
                }
                if (!context.mounted) {
                  return;
                }
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
                            return const Divider(height: 1, thickness: 0.3);
                          },
                          itemCount: widgets.length,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }

      return [GroupItem(options: options), GroupItem(options: options1)];
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: GroupScreen.routSettings("rules"),
        builder: (context) =>
            GroupScreen(title: tcontext.meta.rule, getOptions: getOptions),
      ),
    );
  }

  Future<List<ClashProxiesNode>> getProxies() async {
    List<ClashProxiesNode> nodes = [];
    var result = await ClashHttpApi.getProxies();
    if (result.error == null) {
      for (var node in result.data!) {
        if (node.hidden) {
          continue;
        }
        nodes.add(node);
      }
    }

    return nodes;
  }
}
