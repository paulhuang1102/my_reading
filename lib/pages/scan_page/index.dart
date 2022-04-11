import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mighty_book/services/media_service.dart';
import 'package:mighty_book/services/ml_service.dart';

class ScanPage extends StatelessWidget {
   ScanPage({ Key? key }) : super(key: key);
  final ms = MediaService();
  final mls = MlService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(''),
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
           
            },
          ),
        ],
      ),
      body: Container(child: 
      
      Column(
        children: [
          ElevatedButton(onPressed: () async {
            final image = await ms.pickImageGallery();
            print(image);
            if (image != null) {
              final rs = await mls.getText(image.imagePath!);
              print(rs);

            }

          }, child: Text('Select'),)
        ],
      ),)
    );
  }
}