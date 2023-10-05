import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app_1/data/datasource/course/course_remote_datasource.dart';
import 'package:learning_app_1/data/model/course/course_response_model.dart';
import 'package:meta/meta.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRemoteDatasource remoteDatasource;

  CourseCubit({required this.remoteDatasource}) : super(CourseInitial());

  void getCourse() async {
    emit(CourseLoading());

    final result = await remoteDatasource.getCourses();

    emit(CourseSuccess(courseResponse: result));
  }
}
