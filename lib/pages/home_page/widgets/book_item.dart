import 'package:flutter/material.dart';
import 'package:mighty_book/models/book_model.dart';

class BookItem extends StatelessWidget {
  const BookItem(this._book, { Key? key }) : super(key: key);
  final Book _book;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_book.name, style: Theme.of(context).textTheme.headline3,),
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}