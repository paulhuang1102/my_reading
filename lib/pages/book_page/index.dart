import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/controllers/vocabulary_controller.dart';
import 'package:mighty_book/models/book_model.dart';

class BookPage extends StatelessWidget {
  BookPage({Key? key}) : super(key: key);
  final VocabularyController _vController = VocabularyController.to;
  @override
  Widget build(BuildContext context) {
    Book book = Get.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _vController.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_vController.list[index].word),
                    trailing: IconButton(
                      onPressed: () {
                        _vController.deleteVocabulary(_vController.list[index]);
                        // _vController.openTranslation(_vController.list[index]);
                      },
                      icon: Icon(Icons.api_sharp),
                    ),
                    onTap: () {
                      Get.toNamed('/vocabulary',
                          arguments: _vController.list[index]);
                    },
                  );
                },
              );
            }),
            TextField(
              controller: _vController.textController,
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                _vController.addVocabulary();
              },
            ),
          ],
        ),
      ),
    );
  }
}
