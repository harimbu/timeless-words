import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/binding/app_binding.dart';
import 'package:timeless_words/controller/word_controller.dart';
import 'package:timeless_words/model/word_model.dart';
import 'package:timeless_words/screen/book_page.dart';
import 'package:timeless_words/screen/detail_page.dart';
import 'package:timeless_words/screen/home_page.dart';
import 'package:timeless_words/theme/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final controller = Get.put(WordController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timeless Words',
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: controller.darkMode.value ? ThemeMode.dark : ThemeMode.light,
        initialBinding: AppBinding(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
          GetPage(
              name: '/detail',
              page: () => DetailPage(word: Get.arguments as Word)),
          GetPage(name: '/book', page: () => BookPage()),
        ],
      ),
    );
  }
}
