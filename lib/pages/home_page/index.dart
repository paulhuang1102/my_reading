import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/routes/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(ROUTES.addBook);
        },
        child: Icon(Icons.add),
        
      ),
    );
  }
}