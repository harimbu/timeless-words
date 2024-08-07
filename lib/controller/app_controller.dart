import 'package:get/get.dart';
import 'package:timeless_words/db/db_helper.dart';
import 'package:timeless_words/model/word_model.dart';

class AppController extends GetxController {
  var wordList = <WordModel>[].obs;
  var currentWord = WordModel(
    id: 0,
    eng: '',
    kor: '',
    writer: '',
    showing: 0,
    adding: 0,
  ).obs;
  var showKor = false.obs;
  var savedWords = <WordModel>[].obs;
  RxBool darkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadWordList();
    loadSavedWords();
  }

  void loadWordList() async {
    final data = await db.getAllWords();
    wordList.value = data.map((e) => WordModel.fromJson(e)).toList();
  }

  void getWordById(int id) async {
    final data = await db.getWordById(id);
    if (data != null) {
      currentWord.value = WordModel.fromJson(data);
    }
  }

  void toggleKorVisibility() {
    showKor.value = !showKor.value;
  }

  void saveWord() async {
    if (!savedWords.any((word) => word.id == currentWord.value.id)) {
      savedWords.add(currentWord.value);
      await db.insertWord(currentWord.value.toJson());
    }
  }

  void deleteWord(int id) async {
    savedWords.removeWhere((word) => word.id == id);
    await db.deleteWord(id);
  }

  void loadSavedWords() async {
    final data = await db.getAllWords();
    savedWords.value = data.map((e) => WordModel.fromJson(e)).toList();
  }

  int get savedWordCount => savedWords.length;
}
