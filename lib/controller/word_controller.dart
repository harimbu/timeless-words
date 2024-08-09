import 'package:get/get.dart';
import 'package:timeless_words/db/db_helper.dart';
import 'package:timeless_words/model/word_model.dart';

class WordController extends GetxController {
  var words = <Word>[].obs;
  var bookmarkedWords = <Word>[].obs;
  RxBool darkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadWords();
    loadBookmarkedWords();
  }

  void changeTheme() {
    darkMode(!darkMode.value);
  }

  Future<void> loadWords() async {
    var result = await DBHelper().getWords();
    words.assignAll(result);
  }

  Future<void> loadBookmarkedWords() async {
    var result = await DBHelper().getBookmarkedWords();
    bookmarkedWords.assignAll(result);
  }

  void toggleBookmark(Word word) async {
    if (isBookmarked(word.id)) {
      word.adding = 0;
      await DBHelper().updateWord(word);
      bookmarkedWords.removeWhere((w) => w.id == word.id);
    } else {
      word.adding = 1;
      await DBHelper().updateWord(word);
      bookmarkedWords.add(word);
    }
    loadWords(); // 리스트를 갱신
  }

  bool isBookmarked(int id) {
    return bookmarkedWords.any((w) => w.id == id);
  }
}
