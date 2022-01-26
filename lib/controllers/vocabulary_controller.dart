import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/models/vocabulary_model.dart';
import 'package:mighty_book/repositories/vocabulary_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class VocabularyController extends GetxController {
  static VocabularyController get to => Get.find<VocabularyController>();
  final VocabularyRepository _repo;

  final TextEditingController textController = TextEditingController();

  final list = RxList<Vocabulary>([]);

  VocabularyController(this._repo);

  @override
  onInit() {
    fetchVocabularies();
    super.onInit();
  }

  @override
  onClose() {
    textController.dispose();
    super.onClose();
  }

  addVocabulary() async {
    if (textController.text.isEmpty) return;
    Book book = Get.arguments as Book;

    await _repo.addVocabulary(
      textController.text,
      book.id,
    );
    textController.clear();

    fetchVocabularies();
  }

  fetchVocabularies() async {
    Book book = Get.arguments as Book;

    final vs = await _repo.fetchVocabularies(book.id);
  
    list(vs.map((l) => Vocabulary(word: l.word, bookId: l.bookId)).toList());
  }

  deleteVocabulary(Vocabulary v) async {
    await _repo.deleteVocabulary(v);
    fetchVocabularies();
  }

  openTranslation(Vocabulary v) {
     launch("https://translate.google.com/?sl=en&tl=zh-TW&text=${v.word}&op=translate");
  }
}
