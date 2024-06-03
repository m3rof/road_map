import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map/features/authentication/login/presentation/view/login_view.dart';
import 'package:road_map/features/authentication/otp/presentation/view/otp_screen.dart';
import 'package:road_map/features/authentication/register/presentation/register_manager/register_cubit.dart';
import 'package:road_map/features/drawer_pages/posts/posts_cubit/posts_cubit.dart';
import 'package:road_map/features/splash/presentation/view/splash_view.dart';

import 'bloc_observer/bloc_observer.dart';
import 'features/authentication/forget_password/presentation/view/forget_password_view.dart';
import 'features/authentication/login/presentation/login_manager/login_cubit.dart';
import 'features/courses/course_basic/presentaion/view/course_home.dart';
import 'features/articles/article_by_track_screen.dart';
import 'features/drawer_pages/posts/widgets/comments_screen.dart';
import 'network/remote/dio_helper.dart';
import 'resourses/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => LoginCubit()),
        BlocProvider(create:(context) => RegisterCubit()),
        BlocProvider(create:(context) => PostsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.themeData,
        home: CourseHome(),
      ),
    );
  }
}
