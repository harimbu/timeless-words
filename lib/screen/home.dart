import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/app_controller.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatelessWidget {
  final AppController controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Obx(() {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeContent: Text('${controller.savedWordCount}'),
                child: Icon(Icons.bookmark),
              ),
            );
          }),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.wordList.length,
          itemBuilder: (context, index) {
            final word = controller.wordList[index];
            return ListTile(
              title: Text(word.eng),
              onTap: () {
                Get.toNamed('/detail', arguments: word.id);
              },
            );
          },
        );
      }),
    );
  }
}
