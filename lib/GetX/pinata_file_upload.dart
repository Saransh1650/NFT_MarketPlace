
import 'dart:io';

import 'package:dio/dio.dart' as prefix;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:test_app/GetX/uploading_file.dart';

import '../Utils/utils.dart';
import 'http_service.dart';

class PinataFileUpload extends GetxController {

  RxBool loading = RxBool(false);

  var pinataUrl = "https://api.pinata.cloud";
  var pinEndpoint = "/pinning/pinFileToIPFS";
  var pinataGateway = "https://gateway.pinata.cloud/ipfs/";

  Future<String> uploadToPinata(File imageFile, String title) async {
    print("uploading");
    try {
      loading.value = true;
      prefix.FormData formData = prefix.FormData.fromMap({
        "file":
            await prefix.MultipartFile.fromFile(imageFile.path, filename: title)
      });

      HttpService httpService = HttpService();
      httpService.init(prefix.BaseOptions(
          baseUrl: pinataUrl,
          contentType: "multipart/form-data",
          headers: {"Authorization": "Bearer $JWT"}));

      final response =
          await httpService.request(endpoint: pinEndpoint, formData: formData);
      print(pinataGateway + response['IpfsHash']);
     
      return (pinataGateway +response['IpfsHash']);

    } catch (e, s) {

      print(e);
      print(s);
      return "";
    } 
  }
}
