import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/word_controller.dart';
import 'package:timeless_words/model/word_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:timeless_words/screen/home_page.dart';
import 'package:timeless_words/theme/themes.dart';

class BookPage extends StatelessWidget {
  final WordController wordController = Get.find();

  BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.offAll(HomePage()),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Saved'),
          actions: [
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(10),
              ),
              badgeContent: Text('${wordController.bookmarkedWords.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
            const SizedBox(width: 26),
          ],
        ),
        body: ListView.builder(
          itemCount: wordController.bookmarkedWords.length,
          itemBuilder: (context, index) {
            Word word = wordController.bookmarkedWords[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                tileColor:
                    wordController.darkMode.value ? Themes.darkBg2 : Themes.bg2,
                leading: Text(word.id.toString()),
                title: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Text(
                    word.eng,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: Text( word.writer, style: Theme.of(context).textTheme.bodySmall,),
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
