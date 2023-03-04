import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/services/theme_services.dart';
import 'package:todoapp/ui/pages/notification_screen.dart';

import 'ui/pages/home_page.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
