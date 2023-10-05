import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:learning_app_1/data/model/course/course_response_model.dart';

class CourseRemoteDatasource {
  Future<CourseResponseModel> getCourses() async {
    try {
      const url =
          'https://edspert.widyaedu.com/exercise/data_course?major_name=IPA&user_email=testerngbayu@gmail.com';
      final response = await Dio().get(url, options: Options(headers: {'x-api-key' : '18be70c0-4e4d-44ff-a475-50c51ece99a0'}));

      final responseToModel = CourseResponseModel.fromJson(response.data);

      return responseToModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
