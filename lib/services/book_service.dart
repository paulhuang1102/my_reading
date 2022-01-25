import 'package:hive/hive.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/services/base_service.dart';

class BookService extends BaseService{
  // PrefManager _perfer = PrefManager();
  static final BookService _instance = BookService._internal();
  factory BookService() => _instance;
  BookService._internal();

  late Box<Book> bookBox;

  @override
  init() async {
    bookBox = await Hive.openBox<Book>('bookBox');

  }


  createBook(String name) {
    final book = Book(
      name: name,
      userId: '1',
    );
  }
}
