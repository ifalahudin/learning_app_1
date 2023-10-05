import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app_1/data/model/banner/banner_response_model.dart';

class BannerRemoteDatasource {
  Future<BannerResponseModel> getBanners() async {
    try {
      const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final response = await Dio().get(url,
          options: Options(
              headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'}));

      final responseToModel = BannerResponseModel.fromJson(response.data);

      return responseToModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
