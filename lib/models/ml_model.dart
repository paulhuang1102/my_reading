import 'package:google_ml_kit/google_ml_kit.dart';

class ImageModel {
  String? imagePath;
  ImageModel({required this.imagePath});
}

class RecognizedText {
  String? block;
  List<TextLine>? lines;

  RecognizedText({required this.lines, this.block});
}