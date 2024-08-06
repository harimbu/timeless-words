import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:timeless_words/controller/app_controller.dart';
import 'package:timeless_words/screen/book.dart';
import 'package:timeless_words/screen/detail.dart';
import 'package:timeless_words/theme/themes.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/img/logo.png',
                    width: 40,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '명언',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.changeTheme();
              },
              icon: Image.asset(
                controller.darkMode.value
                    ? 'assets/img/sun.png'
                    : 'assets/img/moon.png',
                width: 24,
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => Book()),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -10),
                badgeContent: Text(
                  controller.addcount.value.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Image.asset(
                  controller.darkMode.value
                      ? 'assets/img/book-dark.png'
                      : 'assets/img/book.png',
                  width: 24,
                ),
              ),
            ),
            const SizedBox(width: 26),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.words.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => Detail(), arguments: controller.words[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: controller.darkMode.value
                              ? Themes.darkBg1
                              : Themes.bg3,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            controller.words[index].id.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
