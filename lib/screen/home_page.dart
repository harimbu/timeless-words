import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/word_controller.dart';
import 'package:timeless_words/model/word_model.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatelessWidget {
  final WordController wordController = Get.put(WordController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Icon(Icons.home_filled),
              const SizedBox(width: 10),
              Text('Timeless Words', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                wordController.darkMode.value
                    ? 'assets/img/sun.png'
                    : 'assets/img/moon.png',
                width: 24,
              ),
              onPressed: () {
                wordController.changeTheme();
              },
            ),
            InkWell(
              onTap: () => Get.toNamed('/book'),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: -10),
                badgeContent: Text('${wordController.bookmarkedWords.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
                child: Image.asset(
                  wordController.darkMode.value
                      ? 'assets/img/book-dark.png'
                      : 'assets/img/book.png',
                  width: 24,
                ),
              ),
            ),
            const SizedBox(width: 26),
          ],
        ),
        body: ListView.builder(
          itemCount: wordController.words.length,
          itemBuilder: (context, index) {
            Word word = wordController.words[index];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: Text(word.id.toString()),
                title: Text(word.eng),
                onTap: () {
                  Get.toNamed('/detail', arguments: word);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
