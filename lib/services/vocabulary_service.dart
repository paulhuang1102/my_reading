import 'package:hive/hive.dart';
import 'package:mighty_book/models/vocabulary_model.dart';
import 'package:mighty_book/services/base_service.dart';

class VocabularyService extends BaseService {
  static final VocabularyService _instance = VocabularyService._internal();
  factory VocabularyService() => _instance;
  VocabularyService._internal();

  // Generic type parameters like Box<List> are unsupported due to Dart limitations.
  // late Box<List<Vocabulary>> box;

  late Box box;

  @override
  init() async {
    if (isInit) {
      return;
    }
    Hive.registerAdapter(VocabularyAdapter());
    box = await Hive.openBox('vocabularyBox');

    super.init();
  }

  Future createVocabulary(String v, String bookId) async {
    await requireInit();

    final vc = Vocabulary(word: v, bookId: bookId);
    final list = await fetchAllById(bookId);

    list.add(vc);

    await box.put(bookId, list);
  }

  Future<List> fetchAllById(String bookId) async {
    await requireInit();

    final data = box.get(bookId) ?? [];

    return data;
  }

  Future deleteVocabulary(Vocabulary v) async {
    await requireInit();

    final list = await fetchAllById(v.bookId);

    list.removeWhere((el) => el.word == v.word);

    await box.put(v.bookId, list);
  }

  
}
