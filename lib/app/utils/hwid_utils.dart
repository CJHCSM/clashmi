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
    headers['x-device-os'] = Platform.operatingSystem;
    //headers['x-ver-os'];
    //headers['x-device-model'];
    return headers;
  }
}
