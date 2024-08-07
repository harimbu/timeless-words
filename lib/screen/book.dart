import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/app_controller.dart';

class Book extends StatelessWidget {
  final AppController controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.savedWords.length,
          itemBuilder: (context, index) {
            final word = controller.savedWords[index];
            return ListTile(
              title: Text(word.eng),
              subtitle: Text('Korean: ${word.kor}'),
            );
          },
        );
      }),
    );
  }
}
