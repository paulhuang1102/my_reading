import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mighty_book/bindings/book_binding.dart';
import 'package:mighty_book/bindings/vocabulary_binding.dart';
import 'package:mighty_book/pages/add_book_page/index.dart';
import 'package:mighty_book/pages/book_page/index.dart';
import 'package:mighty_book/pages/home_page/index.dart';
import 'package:mighty_book/pages/scan_page/index.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: ROUTES.home,
      page: () => const HomePage(),
      bindings: [
        BookBinding(),
      ],
    ),
    GetPage(
      name: ROUTES.addBook,
      page: () => AddBookPage(),
      binding: BookBinding(),
    ),
    GetPage(name: ROUTES.book, page: () => BookPage(), bindings: [
      VocabularyBinding(),
    ]),
    GetPage(name: ROUTES.scan, page: () => ScanPage(), )
  ];
}
