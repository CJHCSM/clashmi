import 'package:clashmi/app/modules/profile_manager.dart';
import 'package:clashmi/app/modules/profile_patch_manager.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/widgets/framework.dart';
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

  Duration? _updateInterval = const Duration(hours: 24);
  String _patch = "";

  @override
  void initState() {
    var profile = ProfileManager.getProfile(widget.profileid);
    if (profile != null) {
      _textControllerRemark.value = _textControllerRemark.value.copyWith(
        text: profile.remark,
      );
      _textControllerUrl.value = _textControllerUrl.value.copyWith(
        text: profile.url,
      );
      _patch = profile.patch;
      _updateInterval = profile.updateInterval;
    }
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
    var profile = ProfileManager.getProfile(widget.profileid);

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
                    width: windowSize.width - 50 * 2,
                    child: Text(
                      tcontext.meta.profileEdit,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: ThemeConfig.kFontWeightTitle,
                          fontSize: ThemeConfig.kFontSizeTitle),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onTapSave();
                    },
                    child: const SizedBox(
                      width: 50,
                      height: 30,
                      child: Icon(
                        Icons.done_outlined,
                        size: 26,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 10, 18, 10),
                                child: Column(
                                  children: [
                                    TextFieldEx(
                                      controller: _textControllerRemark,
                                      textInputAction:
                                          profile != null && profile.isRemote()
                                              ? TextInputAction.next
                                              : TextInputAction.done,
                                      decoration: InputDecoration(
                                        labelText: tcontext.meta.remark,
                                        hintText: tcontext.meta.remark,
                                      ),
                                    ),
                                    profile != null && profile.isRemote()
                                        ? const SizedBox(
                                            height: 20,
                                          )
                                        : const SizedBox.shrink(),
                                    profile != null && profile.isRemote()
                                        ? TextFieldEx(
                                            maxLines: 4,
                                            controller: _textControllerUrl,
                                            decoration: InputDecoration(
                                              labelText: tcontext.meta.url,
                                              hintText: tcontext.meta.url,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FutureBuilder(
                                      future: getGroupOptions(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<GroupItem>>
                                              snapshot) {
                                        List<GroupItem> data = snapshot.hasData
                                            ? snapshot.data!
                                            : [];
                                        return Column(
                                            children:
                                                GroupItemCreator.createGroups(
                                                    context, data));
                                      },
                                    ),
                                  ],
                                ))),
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSave() {
    var profile = ProfileManager.getProfile(widget.profileid);
    if (profile == null) {
      Navigator.pop(context);
      return;
    }

    String remarkText = _textControllerRemark.text.trim();
    String urlText = _textControllerUrl.text.trim();
    if (profile.remark == remarkText &&
        profile.url == urlText &&
        profile.patch == _patch &&
        profile.updateInterval == _updateInterval) {
      Navigator.pop(context);
      return;
    }
    if (_updateInterval != null) {
      if (_updateInterval!.inMinutes < 5) {
        _updateInterval = const Duration(minutes: 5);
      }
    }

    final err = checkUrl(profile.url, urlText);
    if (err != null) {
      DialogUtils.showAlertDialog(context, err);
      return;
    }
    profile.remark = remarkText;
    profile.url = urlText;
    profile.patch = _patch;
    profile.updateInterval = _updateInterval;
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
    var profile = ProfileManager.getProfile(widget.profileid);
    if (profile == null) {
      return [];
    }
    final tcontext = Translations.of(context);

    List<Tuple2<String?, String>> overwrite = [
      Tuple2("", tcontext.profilePatchMode.currentSelected),
      Tuple2(
          kProfilePatchBuildinOverwrite, tcontext.profilePatchMode.overwrite),
      Tuple2(kProfilePatchBuildinNoOverwrite,
          tcontext.profilePatchMode.noOverwrite)
    ];
    final items = ProfilePatchManager.getProfilePatchs();
    for (var item in items) {
      overwrite.add(Tuple2(item.id, item.id));
    }
    List<GroupItem> groupOptions = [];
    List<GroupItemOptions> options = [
      GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
              name: tcontext.meta.coreOverwrite,
              selected: _patch,
              tupleStrings: overwrite,
              onPicker: (String? selected) async {
                _patch = selected ?? "";
                setState(() {});
              })),
      profile.isRemote()
          ? GroupItemOptions(
              timerIntervalPickerOptions: GroupItemTimerIntervalPickerOptions(
                  name: tcontext.meta.updateInterval,
                  tips: tcontext.meta.updateInterval5mTips,
                  duration: _updateInterval,
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

                    _updateInterval = duration;
                    setState(() {});
                  }))
          : GroupItemOptions(),
    ];
    groupOptions.add(GroupItem(options: options));
    return groupOptions;
  }
}
