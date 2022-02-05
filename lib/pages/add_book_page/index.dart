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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: _bookController.setName,
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30.0)),
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
