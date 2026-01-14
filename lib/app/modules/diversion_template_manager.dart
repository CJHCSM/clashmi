// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:clashmi/app/utils/log.dart';
import 'package:clashmi/app/utils/path_utils.dart';

class RuleProviderHttp {
  RuleProviderHttp({
    this.url = "",
    this.format = "",
    this.behavior = "",

    this.interval = const Duration(hours: 12),
  });

  String url;
  String format;
  String behavior;
  Duration? interval;

  Map<String, dynamic> toJson() {
    late String path_;
    final uri = Uri.tryParse(url);
    if (uri != null && uri.path.isNotEmpty) {
      path_ = "./rules/${path.basename(uri.path)}";
    } else {
      path_ = "./rules/${url.hashCode}";
    }
    var ret = {
      'url': url,
      'format': format,
      'behavior': behavior,
      'path': path_,
      'interval': interval?.inSeconds,
    };

    return ret;
  }

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    url = map['url'];
    format = map['format'] ?? '';
    behavior = map['behavior'] ?? '';

    int? intervalSeconds = map['interval'];
    if (!getFormats().contains(format)) {
      format = getFormats().first;
    }
    if (!getBehaviors().contains(behavior)) {
      behavior = getBehaviors().first;
    }

    if (intervalSeconds != null) {
      interval = Duration(seconds: intervalSeconds);
    }
    if (interval != null) {
      if (interval!.inMinutes < 10) {
        interval = Duration(hours: 12);
      }
    }
  }

  static RuleProviderHttp fromJsonStatic(Map<String, dynamic>? map) {
    RuleProviderHttp config = RuleProviderHttp();
    config.fromJson(map);
    return config;
  }

  static List<String> getFormats() {
    return ["mrs"];
  }

  static List<String> getBehaviors() {
    return ["domain", "ipcidr"];
  }
}

class RuleProvider {
  RuleProvider({this.name = "", this.type = "", this.http});
  String name = "";
  String type = "";
  RuleProviderHttp? http;

  Map<String, dynamic> toJsonNoName() => {
    'type': type,
    ...http?.toJson() ?? {},
  };
  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type,
    ...http?.toJson() ?? {},
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    name = map['name'] ?? '';
    type = map['type'] ?? '';
    if (!getTypes().contains(type)) {
      type = getTypes().first;
    }
    http = RuleProviderHttp.fromJsonStatic(map);
  }

  static List<String> getTypes() {
    return ["http"];
  }
}

class RuleTemplate {
  RuleTemplate({this.name = "", this.rules = const []});
  String name = "";
  List<String> rules = [];

  Map<String, dynamic> toJson() => {'name': name, 'rules': rules};
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    name = map['name'] ?? '';
    rules = List<String>.from(map['rules'] ?? []);
  }

  Set<String> getProviders() {
    Set<String> providers = {};
    for (var rule in rules) {
      List<String> parts = parseRule(rule);
      if (parts.length == 2) {
        if (parts[0] == "RULE-SET") {
          providers.add(parts[1]);
        }
      }
    }
    return providers;
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    if (oldIndex >= rules.length || newIndex >= rules.length) {
      return;
    }
    var item = rules.removeAt(oldIndex);
    rules.insert(newIndex, item);
  }

  static List<String> getTypes() {
    return ["RULE-SET", "GEOSITE", "GEOIP", "IP-ASN", "MATCH"];
  }

  static List<String> parseRule(String rule) {
    if (rule.isEmpty) {
      return [];
    }
    return rule.split(",");
  }
}

class DiversionTemplates {
  List<RuleProvider> ruleProviders = [];
  List<RuleTemplate> ruleTemplates = [];

  Map<String, dynamic> toJson() => {
    'rule-providers': ruleProviders,
    'rule-templates': ruleTemplates,
  };

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    final p = map['rule-providers'];
    if (p is List) {
      for (var value in p) {
        RuleProvider ps = RuleProvider();
        ps.fromJson(value);
        ruleProviders.add(ps);
      }
    }
    final t = map['rule-templates'];
    if (t is List) {
      for (var value in t) {
        RuleTemplate rt = RuleTemplate();
        rt.fromJson(value);
        ruleTemplates.add(rt);
      }
    }
  }
}

class DiversionTemplateManager {
  static final DiversionTemplates _diversionTemplates = DiversionTemplates();

  static final List<void Function(String)> onEventRuleProviderAdd = [];
  static final List<void Function(String)> onEventRuleProviderRemove = [];
  static final List<void Function(String)> onEventRuleTemplateAdd = [];
  static final List<void Function(String)> onEventRuleTemplateRemove = [];
  static bool _saving = false;

  static Future<void> init() async {
    await load();
  }

  static Future<void> uninit() async {}
  static Future<void> reload() async {
    _diversionTemplates.ruleProviders.clear();
    _diversionTemplates.ruleTemplates.clear();
    await load();
  }

  static Future<void> save() async {
    if (_saving) {
      return;
    }
    _saving = true;
    String filePath = await PathUtils.diversionTemplateConfigFilePath();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_diversionTemplates);
    try {
      await File(filePath).writeAsString(content, flush: true);
    } catch (err, stacktrace) {
      Log.w(
        "DiversionTemplateManager.save exception  $filePath ${err.toString()}",
      );
    }
    _saving = false;
  }

  static Future<void> load() async {
    String filePath = await PathUtils.diversionTemplateConfigFilePath();
    var file = File(filePath);
    bool exists = await file.exists();
    if (exists) {
      try {
        String content = await file.readAsString();
        if (content.isNotEmpty) {
          var config = jsonDecode(content);
          _diversionTemplates.fromJson(config);
        }
      } catch (err, stacktrace) {
        Log.w("DiversionTemplateManager.load exception ${err.toString()} ");
      }
    } else {
      await save();
    }
  }

  static void removeRuleProviderByName(String name) async {
    for (int i = 0; i < _diversionTemplates.ruleProviders.length; ++i) {
      if (name == _diversionTemplates.ruleProviders[i].name) {
        _diversionTemplates.ruleProviders.removeAt(i);
        break;
      }
    }

    for (var event in onEventRuleProviderRemove) {
      event(name);
    }

    await save();
  }

  static void removeRuleTemplateByName(String name) async {
    for (int i = 0; i < _diversionTemplates.ruleTemplates.length; ++i) {
      if (name == _diversionTemplates.ruleTemplates[i].name) {
        _diversionTemplates.ruleTemplates.removeAt(i);
        break;
      }
    }

    for (var event in onEventRuleTemplateRemove) {
      event(name);
    }

    await save();
  }

  static RuleProvider? getRuleProviderByName(String name) {
    for (var provider in _diversionTemplates.ruleProviders) {
      if (provider.name == name) {
        return provider;
      }
    }
    return null;
  }

  static RuleTemplate? getRuleTemplateByName(String name) {
    for (var template in _diversionTemplates.ruleTemplates) {
      if (template.name == name) {
        return template;
      }
    }
    return null;
  }

  static List<RuleProvider> getRuleProviders() {
    return _diversionTemplates.ruleProviders;
  }

  static List<RuleTemplate> getRuleTemplates() {
    return _diversionTemplates.ruleTemplates;
  }

  static Set<String> getRuleProvidersNames() {
    return _diversionTemplates.ruleProviders
        .map((element) => element.name)
        .toSet();
  }

  static void addRuleProvider(RuleProvider provider) {
    _diversionTemplates.ruleProviders.add(provider);
  }

  static void addRuleTemplate(RuleTemplate template) {
    _diversionTemplates.ruleTemplates.add(template);
  }

  static void updateRuleProvider(String name, RuleProvider provider) {
    for (int i = 0; i < _diversionTemplates.ruleProviders.length; ++i) {
      if (name == _diversionTemplates.ruleProviders[i].name) {
        _diversionTemplates.ruleProviders[i] = provider;
        break;
      }
    }
  }

  static void updateRuleTemplate(String name, RuleTemplate template) {
    for (int i = 0; i < _diversionTemplates.ruleTemplates.length; ++i) {
      if (name == _diversionTemplates.ruleTemplates[i].name) {
        _diversionTemplates.ruleTemplates[i] = template;
        break;
      }
    }
  }

  static Set<String> getRuleTemplatesNames() {
    return _diversionTemplates.ruleTemplates
        .map((element) => element.name)
        .toSet();
  }

  static void reorderRuleProvider(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    if (oldIndex >= _diversionTemplates.ruleProviders.length ||
        newIndex >= _diversionTemplates.ruleProviders.length) {
      return;
    }
    var item = _diversionTemplates.ruleProviders.removeAt(oldIndex);
    _diversionTemplates.ruleProviders.insert(newIndex, item);
  }

  static void reorderRuleTemplates(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    if (oldIndex >= _diversionTemplates.ruleTemplates.length ||
        newIndex >= _diversionTemplates.ruleTemplates.length) {
      return;
    }
    var item = _diversionTemplates.ruleTemplates.removeAt(oldIndex);
    _diversionTemplates.ruleTemplates.insert(newIndex, item);
  }
}
