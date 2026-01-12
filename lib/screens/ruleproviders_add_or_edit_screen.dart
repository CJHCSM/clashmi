import 'package:clashmi/app/modules/rule_providers_manager.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:flutter/material.dart';

class RuleProvidersAddOrEditScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return RouteSettings(name: "RuleProvidersAddOrEditScreen ");
  }

  final String name;
  const RuleProvidersAddOrEditScreen({super.key, this.name = ""});

  @override
  State<RuleProvidersAddOrEditScreen> createState() =>
      _RuleProvidersAddOrEditScreenState();
}

class _RuleProvidersAddOrEditScreenState
    extends LasyRenderingState<RuleProvidersAddOrEditScreen> {
  late String _type;
  String _name = "";
  String _url = "";
  late String _format;
  late String _behavior;
  Duration? _interval = const Duration(hours: 12);
  @override
  void initState() {
    if (widget.name.isNotEmpty) {
      RuleProvider? provider = RuleProvidersManager.getRuleProviderByName(
        widget.name,
      );
      if (provider != null) {
        _name = provider.name;
        _type = provider.type;
        if (_type == "http" && provider.http != null) {
          _url = provider.http!.url;
          _format = provider.http!.format;
          _behavior = provider.http!.behavior;
          _interval = provider.http!.interval;
        }
      } else {
        _type = RuleProvider.getTypes().first;
        _behavior = RuleProviderSettingHttp.getBehaviors().first;
        _format = RuleProviderSettingHttp.getFormats().first;
      }
    } else {
      _type = RuleProvider.getTypes().first;
      _behavior = RuleProviderSettingHttp.getBehaviors().first;
      _format = RuleProviderSettingHttp.getFormats().first;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.zero, child: AppBar()),
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
                        child: Icon(Icons.arrow_back_ios_outlined, size: 26),
                      ),
                    ),
                    SizedBox(
                      width: windowSize.width - 50 * 2,
                      child: Text(
                        "Rule Provider",
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
                        child: Icon(Icons.done, size: 26),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: SingleChildScrollView(
                  child: FutureBuilder(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapSave() async {
    if (_name.isEmpty) {
      DialogUtils.showAlertDialog(context, "name required");
      return;
    }
    if (_url.isEmpty) {
      DialogUtils.showAlertDialog(context, "url required");
      return;
    }
    final names = RuleProvidersManager.getRuleProvidersNames();
    if (widget.name.isEmpty) {
      if (names.contains(_name)) {
        DialogUtils.showAlertDialog(context, "name:$_name already exists");
        return;
      }
    } else {
      if ((widget.name != _name) && names.contains(_name)) {
        DialogUtils.showAlertDialog(context, "name:$_name already exists");
        return;
      }
    }

    RuleProvider newProvider = RuleProvider();
    newProvider.name = _name;
    newProvider.type = _type;
    if (_type == "http") {
      newProvider.http = RuleProviderSettingHttp(
        url: _url,
        format: _format,
        behavior: _behavior,
        interval: _interval,
      );
    }
    if (widget.name.isNotEmpty) {
      RuleProvidersManager.updateProvider(widget.name, newProvider);
    } else {
      RuleProvidersManager.getRuleProviders().add(newProvider);
    }

    await RuleProvidersManager.save();
    if (!mounted) {
      return;
    }
    Navigator.pop(context);
  }

  Future<List<GroupItem>> getGroupOptions() async {
    final tcontext = Translations.of(context);

    List<GroupItem> groupOptions = [];
    List<GroupItemOptions> options = [
      GroupItemOptions(
        stringPickerOptions: GroupItemStringPickerOptions(
          name: tcontext.meta.coreOverwrite,
          selected: _type,
          strings: RuleProvider.getTypes(),
          onPicker: (String? selected) async {
            _type = selected ?? RuleProvider.getTypes().first;
            setState(() {});
          },
        ),
      ),
      GroupItemOptions(
        textFormFieldOptions: GroupItemTextFieldOptions(
          name: tcontext.meta.name,
          text: _name,
          textWidthPercent: 0.7,
          hint: "rule name",
          onChanged: (String value) {
            _name = value;
          },
        ),
      ),

      if (_type == "http") ...[
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: "url",
            text: _url,
            hint: "https://e.com/rule.mrs",
            textWidthPercent: 0.7,
            onChanged: (String value) {
              _url = value;
            },
          ),
        ),
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: "format",
            selected: _format,
            strings: RuleProviderSettingHttp.getFormats(),
            onPicker: (String? selected) async {
              _format = selected ?? RuleProviderSettingHttp.getFormats().first;
              setState(() {});
            },
          ),
        ),
        GroupItemOptions(
          stringPickerOptions: GroupItemStringPickerOptions(
            name: "behavior",
            selected: _behavior,
            strings: RuleProviderSettingHttp.getBehaviors(),
            onPicker: (String? selected) async {
              _behavior =
                  selected ?? RuleProviderSettingHttp.getBehaviors().first;
              setState(() {});
            },
          ),
        ),
        GroupItemOptions(
          timerIntervalPickerOptions: GroupItemTimerIntervalPickerOptions(
            name: tcontext.meta.updateInterval,
            duration: _interval,
            showDays: true,
            showHours: true,
            showMinutes: true,
            showSeconds: false,
            showDisable: true,
            onPicker: (bool canceled, Duration? duration) async {
              if (canceled) {
                return;
              }
              _interval = duration;
              setState(() {});
            },
          ),
        ),
      ],
    ];

    groupOptions.add(GroupItem(options: options));

    return groupOptions;
  }
}
