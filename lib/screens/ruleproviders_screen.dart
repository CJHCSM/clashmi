import 'package:clashmi/app/modules/rule_providers_manager.dart';
import 'package:clashmi/screens/theme_config.dart';
import 'package:clashmi/screens/theme_define.dart';
import 'package:clashmi/screens/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:clashmi/screens/ruleproviders_add_or_edit_screen.dart';

class RuleProvidersScreen extends LasyRenderingStatefulWidget {
  static RouteSettings routSettings() {
    return RouteSettings(name: "RuleProvidersScreen");
  }

  const RuleProvidersScreen({super.key});

  @override
  State<RuleProvidersScreen> createState() => _RuleProvidersScreenState();
}

class _RuleProvidersScreenState
    extends LasyRenderingState<RuleProvidersScreen> {
  @override
  void initState() {
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
                        "Rule Providers",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: ThemeConfig.kFontWeightTitle,
                          fontSize: ThemeConfig.kFontSizeTitle,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        onTapAdd();
                      },
                      child: const SizedBox(
                        width: 50,
                        height: 30,
                        child: Icon(Icons.add_outlined, size: 26),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(child: _loadListView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadListView() {
    Size windowSize = MediaQuery.of(context).size;
    final ruleProviders = RuleProvidersManager.getRuleProviders();
    return Scrollbar(
      child: ListView.separated(
        itemCount: ruleProviders.length,
        itemBuilder: (BuildContext context, int index) {
          var current = ruleProviders[index];
          return createWidget(index, current, windowSize);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1, thickness: 0.3);
        },
      ),
    );
  }

  Widget createWidget(int index, RuleProvider current, Size windowSize) {
    const double rightWidth = 30.0;
    double centerWidth = windowSize.width - rightWidth - 20;

    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Material(
        borderRadius: ThemeDefine.kBorderRadius,
        child: InkWell(
          onTap: () {
            onTapEdit(current.name);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: centerWidth,
                              child: Text(
                                current.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ThemeConfig.kFontSizeGroupItem,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: rightWidth,
                              height: ThemeConfig.kListItemHeight2 - 2,
                              child: InkWell(
                                onTap: () async {
                                  onTapDelete(current.name);
                                },
                                child: const Icon(
                                  Icons.remove_circle_outlined,
                                  size: 26,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
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

  void onTapAdd() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: RuleProvidersAddOrEditScreen.routSettings(),
        builder: (context) => RuleProvidersAddOrEditScreen(),
      ),
    );
    setState(() {});
  }

  void onTapDelete(String name) async {
    RuleProvidersManager.remove(name);
    await RuleProvidersManager.save();
    setState(() {});
  }

  void onTapEdit(String name) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        settings: RuleProvidersAddOrEditScreen.routSettings(),
        builder: (context) => RuleProvidersAddOrEditScreen(name: name),
      ),
    );
    setState(() {});
  }
}
