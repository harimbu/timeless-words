import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeless_words/controller/app_controller.dart';

class Detail extends StatelessWidget {
  final AppController controller = Get.find<AppController>();

  Detail({Key? key}) : super(key: key) {
    final int id = Get.arguments as int;
    controller.getWordById(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final word = controller.currentWord.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${word.id}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('English: ${word.eng}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              if (controller.showKor.value)
                Text('Korean: ${word.kor}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Writer: ${word.writer}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.toggleKorVisibility();
                },
                child: Text(controller.showKor.value ? 'Hide Korean' : 'Show Korean'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (controller.savedWords.any((w) => w.id == word.id)) {
                    controller.deleteWord(word.id);
                  } else {
                    controller.saveWord();
                  }
                },
                child: Text(controller.savedWords.any((w) => w.id == word.id) ? 'Remove from Book' : 'Save to Book'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
