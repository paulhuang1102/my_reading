import 'package:get/instance_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';

class BookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookController>(() => BookController());
  }
}