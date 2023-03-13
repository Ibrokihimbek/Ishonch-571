// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
//
//
// class CourseCubit extends Cubit<CourseState> {
//   CourseCubit(int id) : super(CourseInitial()){
//     getCourseById(id);
//   }
//
//   getCourseById(int id) async {
//     emit(GettingCourseInProgress());
//     MyResponse myResponse = await getIt<SecureApiService>().getCourseById(id);
//     if(myResponse.errorMessage.isNotEmpty){
//       emit(GettingCourseInFailury(status: myResponse.errorMessage));
//     }else{
//       emit(GettingCourseInSuccess(courseModel: myResponse.data));
//     }
//
//   }
// }