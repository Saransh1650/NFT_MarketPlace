import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_app/GetX/uploading_file.dart';

class ImageViewContainer extends StatelessWidget {
  const ImageViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    FileUpload controller = Get.put(FileUpload());
    return Obx(() {
                return Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blueAccent)),
                  child: controller.imageContainer.isFalse
                      ? AnimateIcon(
                          onTap: () async {
                            controller.imageUrl.value = await controller.getImageGallery();
                            
                            
                            Future.delayed(Duration(seconds: 3), () {
                              controller.imageContainer.value = true;
                            }, );
                            // await ImagePickerService.pickImage(context);
                            ///  print(ImagePickerService.cid);
                          },
                          animateIcon: AnimateIcons.upload,
                          iconType: IconType.continueAnimation,
                          color: Colors.white,
                        )
                      : Image.network(controller.imageUrl.value, fit: BoxFit.fill,),
                );
              });
  }
}