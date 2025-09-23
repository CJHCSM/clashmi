// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:clashmi/app/clash/clash_config.dart';
import 'package:clashmi/app/runtime/return_result.dart';
import 'package:clashmi/app/utils/http_utils.dart';

import '../utils/did.dart';

class ClashConfigs {
  int port = 0;
  int socks_port = 0;
  int redir_port = 0;
  int tproxy_port = 0;
  int mixed_port = 0;
/*
 "tun": {
        "enable": false,
        "device": "",
        "stack": "gVisor",
        "dns-hijack": null,
        "auto-route": false,
        "auto-detect-interface": false,
        "file-descriptor": 0
    }, */
  bool allow = false;
  String bind_address = "";
  bool inbound_tfo = false;
  bool inbound_mptcp = false;
  String mode = "direct";
  bool unified_delay = false;
  String log_level = "info";
  bool ipv6 = false;
  String interface_name = "";
  int routing_mark = 0;
  /* "geox-url": {
        "geo-site": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
        "geo-ip": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.dat",
        "mmdb": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb",
        "asn": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/GeoLite2-ASN.mmdb",
    },*/
  bool geo_auto_update = false;
  int geo_update_interval = 24;
  bool geodata_mode = false;
  String geodata_loader = "";
  String geosite_matcher = "";
  bool tcp_concurrent = false;
  String find_process_mode = "off";
  bool sniffing = false;
  String global_client_fingerprint = "";
  String global_ua = "";
  bool etag_support = false;
  int keep_alive_idle = 0;
  int keep_alive_interval = 30;
  bool disable_keep_alive = false;

  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    {
      port = map["port"] ?? 0;
      socks_port = map["socks-port"] ?? 0;
      redir_port = map["redir-port"] ?? 0;
      tproxy_port = map["tproxy-port"] ?? 0;
      mixed_port = map["mixed-port"] ?? 0;
      /*"tun": {
        "enable": false,
        "device": "",
        "stack": "gVisor",
        "dns-hijack": null,
        "auto-route": false,
        "auto-detect-interface": false,
        "file-descriptor": 0
    },*/

      allow = map["allow-lan"] ?? false;
      bind_address = map["bind-address"] ?? "";
      inbound_tfo = map["inbound-tfo"] ?? false;
      inbound_mptcp = map["inbound-mptcp"] ?? false;
      mode = map["mode"] ?? "";
      unified_delay = map["unified-delay"] ?? false;
      log_level = map["log-level"] ?? "";
      ipv6 = map["ipv6"] ?? false;
      interface_name = map["interface-name"] ?? "";
      routing_mark = map["routing-mark"] ?? 0;
      /* "geox-url": {
        "geo-ip": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.dat",
        "mmdb": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb",
        "asn": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb",
        "geo-site": "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
    },*/
      geo_auto_update = map["geo-auto-update"] ?? false;
      geo_update_interval = map["geo-update-interval"] ?? 0;
      geodata_mode = map["geodata-mode"] ?? false;
      geodata_loader = map["geodata-loader"] ?? "";
      geosite_matcher = map["geosite-matcher"] ?? "";
      tcp_concurrent = map["tcp-concurrent"] ?? false;
      find_process_mode = map["find-process-mode"] ?? "";
      sniffing = map["sniffing"] ?? false;
      global_client_fingerprint = map["global-client-fingerprint"] ?? "";
      global_ua = map["global-ua"] ?? "";
      etag_support = map["etag-support"] ?? false;
      keep_alive_idle = map["keep-alive-idle"] ?? 0;
      keep_alive_interval = map["keep-alive-interval"] ?? 0;
      disable_keep_alive = map["disable-keep-alive"] ?? false;
    }
  }
}

class ClashTraffic {
  int upload = 0;
  int download = 0;
  Map<String, dynamic> toJson() => {
        'up': upload,
        'down': download,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    upload = map['up'] ?? 0;
    download = map['down'] ?? 0;
  }
}

class ClashConnections {
  num uploadTotal = 0;
  num downloadTotal = 0;
  num memory = 0;
  Map<String, dynamic> toJson() => {
        'uploadTotal': uploadTotal,
        'downloadTotal': downloadTotal,
        'memory': memory,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    uploadTotal = map['uploadTotal'] ?? 0;
    downloadTotal = map['downloadTotal'] ?? 0;
    memory = map['memory'] ?? 0;
  }
}

class ClashLog {
  String type = "";
  String payload = "";
  Map<String, dynamic> toJson() => {
        'type': type,
        'payload': payload,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    type = map['type'] ?? '';
    payload = map['payload'] ?? '';
  }
}

class ClashProxiesNode {
  List<String> all = [];
  String name = "";
  String now = "";
  String type = "";
  int? delay;
  bool hidden = false;

  Map<String, dynamic> toJson() => {
        'all': all,
        'name': name,
        'now': now,
        'type': type,
        'delay': delay,
        'hidden': hidden,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }

    var a = map['all'];
    if (a is List) {
      for (var aa in a) {
        all.add(aa as String);
      }
    }
    name = map['name'] ?? "";
    now = map['now'] ?? "";
    type = map['type'] ?? "";
    hidden = map['hidden'] ?? false;
    var history = map['history'];
    if (history is List) {
      if (history.isNotEmpty) {
        delay = history.last["delay"] as int;
        if (delay == 0) {
          delay = null;
        }
      }
    }
  }
}

//https://yacd.haishan.me/#/proxies
//http://127.0.0.1:9090/proxies  GET application/json
class ClashProxies {
  Map<String, ClashProxiesNode> proxies = {};

  Map<String, dynamic> toJson() => {
        'proxies': proxies,
      };
  void fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return;
    }
    var p = map['proxies'];
    if (p is Map) {
      p.forEach((key, value) {
        var node = ClashProxiesNode();
        node.fromJson(value);
        proxies[key] = node;
      });
      proxies.forEach((key, value) {
        value.delay = updateGroupDelay(proxies, value);
      });
    }
  }

  int? updateGroupDelay(
      Map<String, ClashProxiesNode> proxies, ClashProxiesNode node) {
    if (node.type != ClashProtocolType.urltest.name &&
        node.type != ClashProtocolType.selector.name &&
        node.type != ClashProtocolType.fallback.name &&
        node.type != ClashProtocolType.loadBalance.name) {
      return node.delay;
    }
    if (node.now.isEmpty) {
      return node.delay;
    }
    final nextNode = proxies[node.now];
    if (nextNode == null) {
      return node.delay;
    }
    return updateGroupDelay(proxies, nextNode);
  }

  List<ClashProxiesNode> toList() {
    List<ClashProxiesNode> nodes = [];
    var global = proxies["GLOBAL"];
    if (global == null) {
      return nodes;
    }
    for (int i = 0; i < global.all.length; ++i) {
      var node = proxies[global.all[i]];
      if (node != null) {
        nodes.add(node);
      } else {
        global.all.removeAt(i);
        --i;
      }
    }

    nodes.add(global);
    return nodes;
  }
}

class ClashHttpApi {
  static String host = "http://127.0.0.1";
  static String wshost = "ws://127.0.0.1";
  static const int timeoutSeconds = 1;
  static int Function()? getControlPort;
  static Future<String> getSecret() async {
    String secret = await Did.getDid();
    return secret.substring(8, 24);
  }

  static Map<String, String> getHeaders(String secret) {
    Map<String, String> headers = {};
    if (secret.isNotEmpty) {
      headers["Authorization"] = "Bearer $secret";
    }
    headers[HttpHeaders.contentTypeHeader] = "application/json; charset=UTF-8";
    return headers;
  }

  static Future<ReturnResult<ClashConfigs>> getConfigs() async {
    String secret = await getSecret();
    Map<String, String> headers = getHeaders(secret);

    var result = await HttpUtils.httpGetRequest(
        "$host:${getControlPort?.call()}/configs",
        null,
        headers,
        const Duration(seconds: timeoutSeconds),
        null,
        null);
    if (result.error != null) {
      return ReturnResult(error: result.error);
    }
    try {
      var decodedResponse = jsonDecode(result.data!);
      ClashConfigs configs = ClashConfigs();
      configs.fromJson(decodedResponse);
      return ReturnResult(data: configs);
    } catch (err) {
      return ReturnResult(error: ReturnResultError(err.toString()));
    }
  }

  static Future<ReturnResult<int>> getDelay(String node,
      {String url = "https://www.gstatic.com",
      Duration timeout = const Duration(seconds: 5)}) async {
    String secret = await getSecret();
    Map<String, String> headers = getHeaders(secret);

    final encodeNode = Uri.encodeComponent(node);
    final encodeUrl = Uri.encodeComponent(url);
    var result = await HttpUtils.httpGetRequest(
        "$host:${getControlPort?.call()}/proxies/$encodeNode/delay?url=$encodeUrl&timeout=${timeout.inMilliseconds}",
        null,
        headers,
        const Duration(seconds: timeoutSeconds),
        null,
        null);
    if (result.error != null) {
      return ReturnResult(error: result.error);
    }
    try {
      var decodedResponse = jsonDecode(result.data!);
      int? delay = decodedResponse["delay"];
      String? err = decodedResponse["message"];
      if (err != null) {
        return ReturnResult(error: ReturnResultError(err));
      }
      return ReturnResult(data: delay);
    } catch (err) {
      return ReturnResult(error: ReturnResultError(err.toString()));
    }
  }

  static Future<ReturnResult<List<ClashProxiesNode>>> getProxies() async {
    String secret = await getSecret();
    Map<String, String> headers = getHeaders(secret);

    var result = await HttpUtils.httpGetRequest(
        "$host:${getControlPort?.call()}/proxies",
        null,
        headers,
        const Duration(seconds: timeoutSeconds),
        null,
        null);
    if (result.error != null) {
      return ReturnResult(error: result.error);
    }
    try {
      var decodedResponse = jsonDecode(result.data!);
      ClashProxies proxies = ClashProxies();
      proxies.fromJson(decodedResponse);
      return ReturnResult(data: proxies.toList());
    } catch (err) {
      return ReturnResult(error: ReturnResultError(err.toString()));
    }
  }

  static List<ClashProxiesNode> getNowChain(
      List<ClashProxiesNode> proxies, ClashProxiesNode node, String mode) {
    if (node.all.isEmpty) {
      return [node];
    }
    for (var proxy in proxies) {
      if (proxy.name == node.now) {
        List<ClashProxiesNode> nodes = getNowChain(proxies, proxy, mode);
        nodes.add(node);
        return nodes;
      }
    }

    return [node];
  }

  static Future<ReturnResult<List<ClashProxiesNode>>> getNowProxy(
      String mode) async {
    if (mode.isEmpty) {
      return ReturnResult(data: null);
    }
    ReturnResult<List<ClashProxiesNode>> result = await getProxies();
    if (result.error != null) {
      return ReturnResult(error: result.error);
    }
    if (result.data!.isEmpty) {
      return ReturnResult(data: null);
    }
    List<ClashProxiesNode> filtered = [];
    for (var node in result.data!) {
      if (node.type == ClashProtocolType.urltest.name ||
          node.type == ClashProtocolType.selector.name ||
          node.type == ClashProtocolType.fallback.name ||
          node.type == ClashProtocolType.loadBalance.name) {
        filtered.add(node);
      }
    }

    if (filtered.isEmpty) {
      return ReturnResult(data: null);
    }

    final proxies = result.data!;
    if (mode == ClashConfigsMode.direct.name) {
      for (var proxy in proxies) {
        if (proxy.type == ClashProtocolType.direct.name) {
          return ReturnResult(data: [proxy]);
        }
      }
    } else if (mode == ClashConfigsMode.global.name) {
      for (var proxy in proxies) {
        if (proxy.name == "GLOBAL") {
          return ReturnResult(data: getNowChain(proxies, proxy, mode));
        }
      }
    }
    return ReturnResult(data: getNowChain(proxies, filtered.first, mode));
  }

  static Future<ReturnResultError?> setProxiesNode(
      String group, String node) async {
    String secret = await getSecret();
    Map<String, String> headers = getHeaders(secret);

    final encodeGroup = Uri.encodeComponent(group);
    var body = JsonEncoder().convert({"name": node});
    var result = await HttpUtils.httpPutRequest(
        "$host:${getControlPort?.call()}/proxies/$encodeGroup",
        null,
        headers,
        body,
        const Duration(seconds: timeoutSeconds),
        null,
        null,
        null);

    return result.error;
  }

  static Future<ReturnResultError?> setConfigsMode(String mode) async {
    String secret = await getSecret();
    Map<String, String> headers = getHeaders(secret);

    var body = JsonEncoder().convert({"mode": mode});
    var result = await HttpUtils.httpPatchRequest(
        "$host:${getControlPort?.call()}/configs",
        null,
        headers,
        body,
        const Duration(seconds: 2),
        null,
        null);

    return result.error;
  }

  static String convertTrafficToStringDouble(num? value, {num kb = 1024}) {
    if (value == null || value < 0) {
      return "";
    }
    num kKB = kb;
    num kMB = kb * kKB;
    num kGB = kb * kMB;
    num kTB = kb * kGB;
    num kPB = kb * kTB;
    if (value >= kPB) {
      return "${(value / kPB).toStringAsFixed(1)} PB";
    }
    if (value >= kTB) {
      return "${(value / kTB).toStringAsFixed(1)} TB";
    }
    if (value >= kGB) {
      return "${(value / kGB).toStringAsFixed(1)} GB";
    }
    if (value >= kMB) {
      return "${(value / kMB).toStringAsFixed(1)} MB";
    }
    if (value >= kKB) {
      return "${(value / kKB).toStringAsFixed(1)} KB";
    }
    return "$value B";
  }
}
//ws://127.0.0.1:9090/traffic?token=e6bf7c4db057a75f
//http://127.0.0.1:9090/providers/proxies GET application/json
//http://127.0.0.1:9090/proxies/%F0%9F%90%9F%20%E6%BC%8F%E7%BD%91%E4%B9%8B%E9%B1%BC
//ws://127.0.0.1:9090/logs?token=e6bf7c4db057a75f&level=info
//http://127.0.0.1:9090/configs?reload=true 
/* {
  "path": "",
  "payload": ""
}*/