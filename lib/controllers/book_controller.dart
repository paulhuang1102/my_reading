import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';


class BookController extends GetxController {
  RxString name = ''.obs;

  static BookController get to => Get.find<BookController>();

  setName(String value) => name(value);

  submitAdd() {
    print(name);



    Get.back();
  }

}