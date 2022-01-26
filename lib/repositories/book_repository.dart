import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/services/book_service.dart';
import 'package:mighty_book/services/vocabulary_service.dart';

class BookRepository {
  final BookService _svc = BookService();
  final VocabularyService _vsvc = VocabularyService();

  BookRepository() {
    // _svc.init();
  }

  getBooks() {
    return _svc.fetchBooks();
  }

  addBook(String name ) {
    _svc.createBook(name);
  }

  deleteBook(Book book) async {
    await _svc.deleteBook(book);
    await _vsvc.deleteAllByBookId(book.id);
  }
}