import 'package:hive_flutter/hive_flutter.dart';

class Helper {
  void setDataHive(Box box, String key, String value) async {
    await box.put(key, value);
  }

  Future<String> getDataHive(Box box, String key) async {
    return await box.get(key);
  }
}
