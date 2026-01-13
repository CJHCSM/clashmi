// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clashmi/app/utils/log.dart';
import 'package:clashmi/app/utils/path_utils.dart';

class RuleProviderHttp {
  RuleProviderHttp({
    this.url = "",
    this.format = "",
    this.behavior = "",
    this.path = "",
    this.interval = const Duration(hours: 12),
  });

  String url;
  String format;
  String behavior;
  String path;
  Duration? interval;

  Map<String, dynamic> toJson() => {
    'url': url,
    'format': format,
    'behavior': behavior,
    'path': path,
    'interval': interval?.inSeconds,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    url = map['url'];
    format = map['format'] ?? '';
    behavior = map['behavior'] ?? '';
    path = map['path'] ?? '';
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
    return ["domains", "ipcidr"];
  }
}

class RuleProvider {
  RuleProvider({this.name = "", this.type = "", this.http});
  String name = "";
  String type = "";
  RuleProviderHttp? http;

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
  RuleTemplate({this.name = "", this.ruleProviders = const []});
  String name = "";
  List<String> ruleProviders = [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'rule-providers': ruleProviders,
  };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    name = map['name'] ?? '';
    ruleProviders = List<String>.from(map['rule-providers'] ?? []);
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
}
