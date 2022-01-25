import 'package:hive/hive.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/services/base_service.dart';

class BookService extends BaseService {
  static final BookService _instance = BookService._internal();
  factory BookService() => _instance;
  BookService._internal();

  late Box<Book> bookBox;

  @override
  init() async {
    print(isInit);

    if (isInit) {
      return;
    }
    Hive.registerAdapter(BookAdapter());
    bookBox = await Hive.openBox<Book>('bookBox');

    super.init();
  }

  createBook(String name) async {
    await requireInit();

    final book = Book(
      name: name,
      userId: '1',
    );

    final result = await bookBox.add(book);
  }

  Future<List<Book>> fetchBooks() async {
    await requireInit();

    final data = bookBox.values.toList();

    return data;
  }
}
