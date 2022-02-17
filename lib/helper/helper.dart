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
      .map((str) =>
          str.trim()[0].toUpperCase() + str.trim().substring(1).toLowerCase())
      .join(" ");
}
