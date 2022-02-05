import 'package:hive/hive.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/services/base_service.dart';
import 'package:uuid/uuid.dart';

class BookService extends BaseService {
  static final BookService _instance = BookService._internal();
  factory BookService() => _instance;
  BookService._internal();

  late Box<Book> bookBox;

  @override
  init() async {
    if (isInit) {
      return;
    }
    Hive.registerAdapter(BookAdapter());
    bookBox = await Hive.openBox<Book>('bookBox');

    super.init();
  }

  createBook(String name) async {
    const uuid = Uuid();
    await requireInit();

    final book = Book(
      id: uuid.v4(),
      name: name,
      userId: '1',
      startAt: DateTime.now()
    );

    final result = await bookBox.add(book);
  }

  Future<List<Book>> fetchBooks() async {
    await requireInit();

    final data = bookBox.values.toList();

    return data;
  }

  deleteBook(Book book) async {
    await requireInit();

    // await bookBox.delete(book);
    book.delete();
  }
}
