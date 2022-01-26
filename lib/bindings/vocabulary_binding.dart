import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import 'package:mighty_book/controllers/vocabulary_controller.dart';
import 'package:mighty_book/repositories/vocabulary_repository.dart';

class VocabularyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VocabularyController>(() => VocabularyController(
      VocabularyRepository()
    ));
  }
}
