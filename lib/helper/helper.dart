import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Helper {
  void setToken(String key, String value) async {
    var box = await Hive.openBox('credentials');
    await box.put("${key}_token", value);
  }

  Future<String> getToken(String key) async {
    var box = await Hive.openBox('credentials');
    return await box.get("${key}_token");
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
}
