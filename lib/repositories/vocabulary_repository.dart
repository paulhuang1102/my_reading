
import 'package:mighty_book/models/vocabulary_model.dart';
import 'package:mighty_book/services/vocabulary_service.dart';

class VocabularyRepository {
  final VocabularyService _svc = VocabularyService();

  addVocabulary(String word, String bookId) {
    _svc.createVocabulary(word, bookId);
  }

  Future<List> fetchVocabularies(String bookId) => _svc.fetchAllById(bookId);
  
  Future deleteVocabulary(Vocabulary v) => _svc.deleteVocabulary(v);
}