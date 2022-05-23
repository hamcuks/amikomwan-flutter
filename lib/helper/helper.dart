import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Helper {
  void setToken(String key, String value) async {
    var box = await Hive.openBox('credentials');
    await box.put("${key}_token", value);
  }

  Future<String> getToken(String key) async {
    var box = await Hive.openBox('credentials');
    return await box.get("${key}_token") ?? '';
  }

  String toUpperCamelCase(String val) => val
      .replaceAll("  ", " ")
      .split(" ")
      .map((str) => (str.length >= 3)
          ? str.trim()[0].toUpperCase() + str.trim().substring(1).toLowerCase()
          : str)
      .join(" ");

  Future<bool> checkConnection() async {
    var result = await Connectivity().checkConnectivity();

    return (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi);
  }

  String weekdayToString(int day) {
    switch (day) {
      case 1:
        return 'senin';
      case 2:
        return 'selasa';
      case 3:
        return 'rabu';
      case 4:
        return 'kamis';
      case 5:
        return 'jumat';
      case 6:
        return 'sabtu';
      case 7:
        return 'minggu';
      default:
        return 'senin';
    }
  }

  int stringToWeekDay(String day) {
    switch (day) {
      case 'senin':
        return 1;
      case 'selasa':
        return 2;
      case 'rabu':
        return 3;
      case 'kamis':
        return 4;
      case 'jumat':
        return 5;
      case 'sabtu':
        return 6;
      case 'minggu':
        return 7;
      default:
        return 1;
    }
  }

  Future<String> getDeviceId() async {
    final DeviceInfoPlugin _device = DeviceInfoPlugin();

    String deviceId = '';

    if (Platform.isIOS) {
      IosDeviceInfo _platform = await _device.iosInfo;
      print(_platform.identifierForVendor);
      deviceId = _platform.identifierForVendor!;
    }

    if (Platform.isAndroid) {
      AndroidDeviceInfo _platform = await _device.androidInfo;
      print(_platform.androidId);
      deviceId = _platform.androidId!;
    }

    return deviceId;
  }
}
