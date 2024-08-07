import 'package:get/get.dart';
import 'package:timeless_words/controller/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
  }
}
