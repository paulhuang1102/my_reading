import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:mighty_book/repositories/book_repository.dart';

class BookController extends GetxController {
  RxString name = ''.obs;
  final list = RxList<Book>([]);
  final BookRepository _repo;

  static BookController get to => Get.find<BookController>();

  BookController(this._repo);

  setName(String value) => name(value);

  @override
  onInit() async {
    updateList();

    super.onInit();
  }

  submitAdd() {
    _repo.addBook(name.value);
    updateList();
    Get.back();
  }

  updateList() async {
    final data = await _repo.getBooks();
    list(data);

  }

  removeBook(Book book) async {
   
    await _repo.deleteBook(book);
    updateList();
    Get.back();
  }
}
