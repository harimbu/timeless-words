
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/binding/app_binding.dart';
import 'package:timeless_words/controller/app_controller.dart';
import 'package:timeless_words/screen/home.dart';
import 'theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timeless Words',
        themeMode: controller.darkMode.value ? ThemeMode.dark : ThemeMode.light,
        darkTheme: Themes.dark,
        theme: Themes.light,
        initialBinding: AppBinding(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => Home()),
        ],
      ),
    );
  }
}
