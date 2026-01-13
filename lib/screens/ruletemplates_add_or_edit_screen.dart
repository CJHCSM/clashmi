import 'package:clashmi/app/modules/diversion_template_manager.dart';
import 'package:clashmi/i18n/strings.g.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/group_item_creator.dart';
import 'package:clashmi/screens/group_item_options.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:flutter/material.dart';

class RuleTemplatesAddOrEditScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return RouteSettings(name: "RuleTemplateAddOrEditScreen ");
  }

  final String name;
  const RuleTemplatesAddOrEditScreen({super.key, this.name = ""});

  @override
  State<RuleTemplatesAddOrEditScreen> createState() =>
      _RuleTemplatesAddOrEditScreenState();
}

class _RuleTemplatesAddOrEditScreenState
    extends LasyRenderingState<RuleTemplatesAddOrEditScreen> {
  late RuleTemplate _data;
  @override
  void initState() {
    if (widget.name.isNotEmpty) {
      final exist = DiversionTemplateManager.getRuleTemplateByName(widget.name);
      if (exist != null) {
        _data = RuleTemplate(
          name: exist.name,
          ruleProviders: exist.ruleProviders.toList(),
        );
      } else {
        _data = RuleTemplate(ruleProviders: []);
      }
    } else {
      _data = RuleTemplate(ruleProviders: []);
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
    final tcontext = Translations.of(context);
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
                        tcontext.meta.rule,
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
    final tcontext = Translations.of(context);
    if (_data.name.isEmpty) {
      DialogUtils.showAlertDialog(context, "name required");
      return;
    }

    final names = DiversionTemplateManager.getRuleTemplatesNames();
    if (widget.name.isEmpty) {
      if (names.contains(_data.name)) {
        DialogUtils.showAlertDialog(
          context,
          "name:${_data.name} already exists",
        );
        return;
      }
    } else {
      if ((widget.name != _data.name) && names.contains(_data.name)) {
        DialogUtils.showAlertDialog(
          context,
          "name:${_data.name} already exists",
        );
        return;
      }
    }
    if (_data.type == "RULE-SET") {
      if (_data.ruleProviders.isEmpty) {
        DialogUtils.showAlertDialog(
          context,
          "${tcontext.meta.ruleProviders} can not be empty",
        );
        return;
      }
    } else if (_data.type == "GEOSITE" ||
        _data.type == "GEOIP" ||
        _data.type == "IP-ASN") {
      if (_data.rule.isEmpty) {
        DialogUtils.showAlertDialog(context, "${_data.type} can not be empty");
        return;
      }
    }

    if (widget.name.isNotEmpty) {
      DiversionTemplateManager.updateRuleTemplate(widget.name, _data);
    } else {
      DiversionTemplateManager.getRuleTemplates().add(_data);
    }

    await DiversionTemplateManager.save();
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
        textFormFieldOptions: GroupItemTextFieldOptions(
          name: tcontext.meta.name,
          text: _data.name,
          textWidthPercent: 0.7,
          hint: "rule name",
          onChanged: (String value) {
            _data.name = value.trim();
          },
        ),
      ),
      GroupItemOptions(
        stringPickerOptions: GroupItemStringPickerOptions(
          name: "Type",
          selected: _data.type,
          strings: RuleTemplate.getTypes(),
          onPicker: (String? selected) async {
            _data.type = selected ?? RuleTemplate.getTypes().first;
            setState(() {});
          },
        ),
      ),
    ];

    final ruleProviders = DiversionTemplateManager.getRuleProvidersNames();

    groupOptions.add(GroupItem(options: options));
    if (_data.type == "RULE-SET") {
      List<GroupItemOptions> options1 = [];
      for (var provider in ruleProviders) {
        options1.add(
          GroupItemOptions(
            switchOptions: GroupItemSwitchOptions(
              name: provider,
              switchValue: _data.ruleProviders.contains(provider),
              onSwitch: (bool value) async {
                if (value) {
                  _data.ruleProviders.add(provider);
                } else {
                  _data.ruleProviders.remove(provider);
                }
                setState(() {});
              },
            ),
          ),
        );
      }
      groupOptions.add(
        GroupItem(options: options1, name: tcontext.meta.ruleProviders),
      );
    } else if (_data.type == "GEOSITE" || _data.type == "GEOIP") {
      List<GroupItemOptions> options1 = [
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: _data.type,
            hint: "${tcontext.meta.required}[CN]",
            textWidthPercent: 0.6,
            textInputAction: TextInputAction.next,
            onChanged: (String value) {
              _data.rule = value;
            },
          ),
        ),
      ];
      groupOptions.add(GroupItem(options: options1));
    } else if (_data.type == "IP-ASN") {
      List<GroupItemOptions> options1 = [
        GroupItemOptions(
          textFormFieldOptions: GroupItemTextFieldOptions(
            name: _data.type,
            hint: "${tcontext.meta.required}[14]",
            textWidthPercent: 0.6,
            textInputAction: TextInputAction.next,
            onChanged: (String value) {
              _data.rule = value;
            },
          ),
        ),
      ];
      groupOptions.add(GroupItem(options: options1));
    }

    return groupOptions;
  }
}
