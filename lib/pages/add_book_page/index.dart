import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({Key? key}) : super(key: key);

  final BookController _bookController = BookController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Add Book'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              onChanged: _bookController.setName,
            ),
            ElevatedButton(
              onPressed: () {
                _bookController.submitAdd();
              },
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
