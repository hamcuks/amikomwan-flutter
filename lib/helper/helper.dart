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
}
