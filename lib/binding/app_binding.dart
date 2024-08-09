import 'package:get/get.dart';
import 'package:timeless_words/controller/word_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WordController());
  }
}
