import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  GetStorage _box = GetStorage();
  String _key = 'isDarkmode';

_saveTheme(bool isDarkmode) => _box.write(_key, isDarkmode);
  bool _loadTheme() => _box.read<bool>(_key) ?? false;
  get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  switchTheme() {
  Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
_saveTheme(!_loadTheme() );
  }
}
