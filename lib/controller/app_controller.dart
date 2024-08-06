import 'package:get/get.dart';

import '../db/db_helper.dart';

class AppController extends GetxController {
  final db = DbHelper();

  @override
  void onInit() {
    super.onInit();
    getCount();
    getWords();
  }

  RxBool darkMode = true.obs;

  var words = [].obs;
  var filterdWords = [].obs;
  RxInt addcount = 0.obs;

  void changeTheme() {
    darkMode(!darkMode.value);
  }

  void getWords() async {
    final data = await db.getAllItems();
    var output = data.toList();
    words(data);
  }

  void getCount() async {
    final data = await db.getAllItems();
    var addItem = data.where((e) => e.adding == 1).toList();
    filterdWords(addItem);
    addcount.value = addItem.length;
  }

  void toggleShow(int id, int showing) async {
    if (showing == 1) {
      await db.updateShow(id, 0);
    } else {
      await db.updateShow(id, 1);
    }
    getCount();
  }

  void toggleAdd(int id, int adding) async {
    if (adding == 1) {
      await db.updateAdd(id, 0);
    } else {
      await db.updateAdd(id, 1);
    }
    getCount();
  }
}
