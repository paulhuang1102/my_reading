import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mighty_book/bindings/book_binding.dart';
import 'package:mighty_book/pages/add_book_page/index.dart';
import 'package:mighty_book/pages/home_page/index.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    // GetPage(
    //   name: ROUTES.splash,
    //   page: () => const SplashPage(),
    // ),
    GetPage(
      name: ROUTES.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: ROUTES.addBook,
      page: () => AddBookPage(),
      binding: BookBinding(),
    ),
  ];
}
