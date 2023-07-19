import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:api_sample2/api/api.dart';
import 'package:api_sample2/model/model.dart';

class Service {
  Dio dio = Dio();
  ApiUrl apiUrlObject = ApiUrl();
  Future<List<Post1>?> getApiResultss() async {
    try {
      final response = await dio.get(apiUrlObject.apiUrl);
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result =
            (response.data as List).map((e) => Post1.fromJson(e)).toList();
        return result;
      }
      return null;
    } on DioError catch (error) {
      log(error.message.toString());
      Get.snackbar('Something went wrong', error.message.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
