import 'package:image_picker/image_picker.dart';
import 'package:mighty_book/models/ml_model.dart';
import 'package:mighty_book/services/base_service.dart';
import 'package:mighty_book/services/exception.dart';

class MediaService extends BaseService{
  final ImagePicker _imagePicker = ImagePicker();
  ImageModel? image;

  Future<ImageModel?> pickImageGallery() async {
    try {
      final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
      final image = ImageModel(imagePath: _image!.path);
      return image;
    } catch (e) {
      ImageNotSelectedException('Image not found');
    }
  }
}
