import 'dart:convert';
import 'dart:io';
import 'package:clashmi/app/utils/did.dart';

class HwidUtils {
  static Future<String> getHwid() async {
    final did = await Did.getDid();
    return base64Encode(utf8.encode(did.hashCode.toString()));
  }

  static Future<Map<String, String>> getHwidHeaders() async {
    Map<String, String> headers = {};
    final hwid = await getHwid();
    headers["x-hwid"] = hwid.toLowerCase();
    if (Platform.isIOS) {
      headers['x-device-os'] = "iOS";
    } else if (Platform.isMacOS) {
      headers['x-device-os'] = "macOS";
    } else if (Platform.isWindows) {
      headers['x-device-os'] = "Windows";
    } else if (Platform.isLinux) {
      headers['x-device-os'] = "Linux";
    } else if (Platform.isAndroid) {
      headers['x-device-os'] = "Android";
    }

    //headers['x-ver-os'];
    //headers['x-device-model'];
    return headers;
  }
}
