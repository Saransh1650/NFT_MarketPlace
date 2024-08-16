import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/GetX/pinata_file_upload.dart';

class FileUpload extends GetxController {
  RxBool imageContainer = RxBool(false);
  final ImagePicker picker = ImagePicker();
  RxString imageUrl = RxString("");
 
  PinataFileUpload controller = Get.put(PinataFileUpload());

  Future<String> getImageGallery() async {
    print("Function init");
    var image = await picker.pickImage(source: ImageSource.gallery);
   
    return controller.uploadToPinata(File(image!.path), "first image");

    

  }
}
