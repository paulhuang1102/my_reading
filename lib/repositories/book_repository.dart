import 'package:mighty_book/services/book_service.dart';

class BookRepository {
  final BookService _svc = BookService();
  
  BookRepository() {
    // _svc.init();
  }

  getBooks() {
    return _svc.fetchBooks();
  }

  addBook(String name ) {
    _svc.createBook(name);
  }
}