import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/controllers/book_controller.dart';
import 'package:mighty_book/controllers/vocabulary_controller.dart';
import 'package:mighty_book/models/book_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mighty_book/widgets/dialog.dart';

class BookPage extends StatelessWidget {
  BookPage({Key? key}) : super(key: key);
  final VocabularyController _vController = VocabularyController.to;
  final BookController _controller = BookController.to;

  @override
  Widget build(BuildContext context) {
    Book book = Get.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              Get.defaultDialog(
                title: 'Delete ${book.name}',
                content: const Text('Are you sure you want to delete this book?'),
                confirm: confirmBtn(() {
                  _controller.removeBook(book);
                }),
                cancel: cancelBtn(),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _vController.list.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            _vController
                                .deleteVocabulary(_vController.list[index]);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(_vController.list[index].word),
                      trailing: IconButton(
                        onPressed: () {
                          _vController
                              .openTranslation(_vController.list[index]);
                        },
                        icon: const Icon(Icons.api_sharp),
                      ),
                      onTap: () {
                        // Get.toNamed('/vocabulary',
                        //     arguments: _vController.list[index]);
                      },
                    ),
                  );
                },
              );
            }),
            const SizedBox(
              height: 160,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: 160,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: TextField(
                        controller: _vController.textController,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Add'),
                      onPressed: () {
                        _vController.addVocabulary();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
