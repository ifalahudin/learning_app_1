part of 'course_cubit.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final CourseResponseModel courseResponse;

  CourseSuccess({required this.courseResponse});
}

final class CourseError extends CourseState {
  final String? message;

  CourseError({this.message});
}
