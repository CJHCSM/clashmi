// ignore_for_file: unused_catch_stack, empty_catches

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clashmi/app/utils/log.dart';
import 'package:clashmi/app/utils/path_utils.dart';

class RuleProviderSettingHttp {
  RuleProviderSettingHttp({
    this.url = "",
    this.format = "",
    this.behavior = "",
    this.path = "",
    this.interval,
  });

  String url;
  String format;
  String behavior;
  String path;
  Duration? interval = const Duration(hours: 12);

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

  static RuleProviderSettingHttp fromJsonStatic(Map<String, dynamic>? map) {
    RuleProviderSettingHttp config = RuleProviderSettingHttp();
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
  RuleProviderSettingHttp? http;

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
    http = RuleProviderSettingHttp.fromJsonStatic(map);
  }

  static List<String> getTypes() {
    return ["http"];
  }
}

class RuleProviders {
  List<RuleProvider> ruleProviders = [];

  Map<String, dynamic> toJson() => {'rule-providers': ruleProviders};

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
  }
}

class RuleProvidersManager {
  static final RuleProviders _config = RuleProviders();

  static final List<void Function(String)> onEventCurrentChanged = [];
  static final List<void Function(String)> onEventAdd = [];
  static final List<void Function(String)> onEventRemove = [];

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
    String filePath = await PathUtils.ruleProvidersConfigFilePath();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String content = encoder.convert(_config);
    try {
      await File(filePath).writeAsString(content, flush: true);
    } catch (err, stacktrace) {
      Log.w("RuleProvidersManager.save exception  $filePath ${err.toString()}");
    }
    _saving = false;
  }

  static Future<void> load() async {
    String filePath = await PathUtils.ruleProvidersConfigFilePath();
    var file = File(filePath);
    bool exists = await file.exists();
    if (exists) {
      try {
        String content = await file.readAsString();
        if (content.isNotEmpty) {
          var config = jsonDecode(content);
          _config.fromJson(config);
        }
      } catch (err, stacktrace) {
        Log.w("RuleProvidersManager.load exception ${err.toString()} ");
      }
    } else {
      await save();
    }
  }

  static Future<void> remove(String name) async {
    for (int i = 0; i < _config.ruleProviders.length; ++i) {
      if (name == _config.ruleProviders[i].name) {
        _config.ruleProviders.removeAt(i);
        break;
      }
    }

    for (var event in onEventRemove) {
      event(name);
    }

    await save();
  }

  static RuleProvider? getRuleProviderByName(String name) {
    for (var provider in _config.ruleProviders) {
      if (provider.name == name) {
        return provider;
      }
    }
    return null;
  }

  static List<RuleProvider> getRuleProviders() {
    return _config.ruleProviders;
  }

  static Set<String> getRuleProvidersNames() {
    return _config.ruleProviders.map((element) => element.name).toSet();
  }

  static void updateProvider(String name, RuleProvider provider) {
    for (int i = 0; i < _config.ruleProviders.length; ++i) {
      if (name == _config.ruleProviders[i].name) {
        _config.ruleProviders[i] = provider;
        break;
      }
    }
  }
}
