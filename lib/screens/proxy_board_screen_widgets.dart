import 'package:clashmi/app/clash/clash_config.dart';
import 'package:clashmi/app/clash/clash_http_api.dart';
import 'package:clashmi/screens/dialog_utils.dart';
import 'package:clashmi/screens/theme_define.dart';
import 'package:clashmi/screens/widgets/sheet.dart';
import 'package:flutter/material.dart';

class ProxyScreenProxiesNodeWidget extends StatefulWidget {
  const ProxyScreenProxiesNodeWidget({super.key, required this.nodes});
  final List<ClashProxiesNode> nodes;
  @override
  State<ProxyScreenProxiesNodeWidget> createState() =>
      _ProxyScreenProxiesNodeWidget();
}

class _ProxyScreenProxiesNodeWidget
    extends State<ProxyScreenProxiesNodeWidget> {
  @override
  Widget build(BuildContext context) {
    Size windowSize = MediaQuery.of(context).size;
    double iconSize = 20;
    var widgets = [];
    for (var node in widget.nodes) {
      if (node.type != ClashProtocolType.urltest.name &&
          node.type != ClashProtocolType.selector.name &&
          node.type != ClashProtocolType.fallback.name &&
          node.type != ClashProtocolType.loadBalance.name) {
        continue;
      }
      String subtitle = "";
      Color? color;
      if (node.delay != null && node.delay! > 0) {
        subtitle = "(${node.delay} ms)";
        if (node.delay! < 800) {
          color = ThemeDefine.kColorGreenBright;
        } else if (node.delay! < 1500) {
          color = Colors.black;
        } else {
          color = Colors.red;
        }
      }
      widgets.add(
        ListTile(
          title: Text(node.name),
          subtitle: node.delay == null
              ? Text(node.type)
              : Row(
                  children: [
                    Text(node.type),
                    Text(
                      subtitle,
                      style: TextStyle(color: color),
                    )
                  ],
                ),
          trailing: SizedBox(
            width: windowSize.width * 0.4,
            child: Row(
              children: [
                SizedBox(
                    width: windowSize.width * 0.4 - iconSize,
                    child: Text(
                      node.now,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    )),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: iconSize,
                )
              ],
            ),
          ),
          minVerticalPadding: 10,
          onTap: () {
            showNodeSelect(widget.nodes, node);
          },
        ),
      );
    }

    return Card(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Scrollbar(
          child: ListView.separated(
        itemBuilder: (_, index) {
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
    ));
  }

  void showNodeSelect(List<ClashProxiesNode> nodes, ClashProxiesNode node) {
    var widgets = [];
    final theme = Theme.of(context);
    for (var name in node.all) {
      int? delay;
      for (var n in nodes) {
        if (n.name == name) {
          delay = n.delay;
          break;
        }
      }
      String subtitle = "";
      Color? color;
      if (delay != null && delay > 0) {
        subtitle = "$delay ms";
        if (delay < 800) {
          color = ThemeDefine.kColorGreenBright;
        } else if (delay < 1500) {
          color = theme.colorScheme.secondary;
        } else {
          color = Colors.red;
        }
      }

      widgets.add(
        ListTile(
          title: Text(name),
          subtitle: delay == null
              ? null
              : Text(
                  subtitle,
                  style: TextStyle(color: color),
                ),
          selected: node.now == name,
          selectedColor: ThemeDefine.kColorBlue,
          onTap: () async {
            var error = await ClashHttpApi.setProxiesNode(node.name, name);
            if (!mounted) {
              return;
            }
            if (error != null) {
              DialogUtils.showAlertDialog(context, error.message);
              return;
            }

            node.now = name;
            Navigator.of(context).pop();
            setState(() {});
          },
        ),
      );
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
}
