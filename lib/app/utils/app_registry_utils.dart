// ignore_for_file: unused_catch_stack

import 'dart:io';

import 'package:clashmi/app/utils/path_utils.dart';
import 'package:win32_registry/win32_registry.dart';

abstract final class AppRegistryUtils {
  static const String _registryPath = 'Software\\ClashMi';
  static const String _registryValueNameDid = 'did';
  static const String _registryValueNameAccessibility = 'accessibility';

  static String? getDid() {
    if (PathUtils.portableMode()) {
      return null;
    }
    return _getAsString(_registryValueNameDid);
  }

  static void saveDid(String did) {
    if (PathUtils.portableMode()) {
      return;
    }
    _saveAsString(_registryValueNameDid, did);
  }

  static bool getAccessibility() {
    return _getAsInt32(_registryValueNameAccessibility) == 1;
  }

  static void saveAccessibility(bool accessibility) {
    _saveAsInt32(_registryValueNameAccessibility, accessibility ? 1 : 0);
  }

  static String? _getAsString(String name) {
    if (!Platform.isWindows) {
      return null;
    }

    try {
      RegistryValue? value = Registry.currentUser.getValue(
        name,
        path: _registryPath,
      );
      if (value == null || value.type != RegistryValueType.string) {
        return null;
      }
      String file = value.data as String;
      return file;
    } catch (err) {}
    return null;
  }

  static void _saveAsString(String name, String value) {
    if (!Platform.isWindows) {
      return;
    }

    try {
      var key = Registry.currentUser.createKey(_registryPath);
      key.createValue(RegistryValue(name, RegistryValueType.string, value));
    } catch (err) {}
  }

  static int? _getAsInt32(String name) {
    if (!Platform.isWindows) {
      return null;
    }

    try {
      RegistryValue? value = Registry.currentUser.getValue(
        name,
        path: _registryPath,
      );
      if (value == null || value.type != RegistryValueType.int32) {
        return null;
      }
      int file = value.data as int;
      return file;
    } catch (err) {}
    return null;
  }

  static void _saveAsInt32(String name, int value) {
    if (!Platform.isWindows) {
      return;
    }

    try {
      var key = Registry.currentUser.createKey(_registryPath);
      key.createValue(RegistryValue(name, RegistryValueType.int32, value));
    } catch (err) {}
  }
}
