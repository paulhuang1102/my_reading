import 'package:get/instance_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';
import 'package:mighty_book/repositories/book_repository.dart';
 
class BookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookController>(() => BookController(
      BookRepository()
    ));
  }
}