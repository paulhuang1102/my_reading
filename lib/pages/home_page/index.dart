import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';
import 'package:mighty_book/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final BookController _controller = BookController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Obx(() {
          return Column(
            children: _controller.list
                .map(
                  (el) => InkWell(
                    onTap: () {
                      Get.toNamed(ROUTES.book, arguments: el);
                    },
                    child: Container(
                      child: Text(el.name),
                    ),
                  ),
                )
                .toList(),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(ROUTES.addBook);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
