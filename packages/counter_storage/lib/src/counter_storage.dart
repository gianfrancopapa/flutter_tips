import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  CounterStorage();

  late final SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  int getInt(String key) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  void setInt(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }
}
