

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map/features/home/presentation/view/home_view.dart';
import 'package:road_map/features/splash/presentation/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../component/component.dart';
import '../../../../../network/remote/dio_helper.dart';
import '../../../../../network/remote/end_points.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool visibility = true;
  Widget iconVisibility = const Icon(Icons.visibility_off_outlined);

  void changeVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
  }

  void changeIconVisibility() {
    visibility
        ? iconVisibility = const Icon(Icons.visibility_off_outlined)
        : iconVisibility = const Icon(Icons.visibility_outlined);
    emit(ChangeIconVisibilityState());
  }

  void moveRegister(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        ));
    emit(NavigationRegisterState());
  }

  void checkValidation(
      {required context,
      required GlobalKey<FormState> key,
      required TextEditingController emailController,
      required TextEditingController passwordController}) {
    if (key.currentState!.validate()) {
       loginUser(context, emailController.text, passwordController.text);
      emit(CheckValidatorLoginState());
    }
  }

  void checkValidationReset(
      {required context,
        required GlobalKey<FormState> key,
        required TextEditingController emailController,
        }) {
    if (key.currentState!.validate()) {
      Navigator.pop(context);
      // loginUser(context, emailController.text, passwordController.text);
      emit(CheckValidatorResetLoginState());
    }
  }


  void loginUser(context, String email, String password)async {
    emit(LoadingLoginState());
      await DioHelper.postData(
          url: login,
          data: {'email': email, 'password': password},
      ).then((value){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
        print(value.data);
        emit(SuccessLoginState());
      }).catchError((Error) {
        print(Error.toString());
        emit(ErrorLoginState());
      });
  }

  // void loginUser(context, String email, String password)async {
  //   emit(LoadingLoginState());
  //   try {
  //     Response response = await DioHelper.postData(
  //         url: login,
  //         data: {'email': email, 'password': password}
  //     );
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const HomeScreen(),
  //         ));
  //     emit(SuccessLoginState());
  //   }on DioException catch (e) {
  //     if (e.response!.statusCode == 406 || e.response!.statusCode == 404) {
  //       print(e.response!.data);
  //       showDialogAwsome(context,'${e.response!.data}',DialogType.error,(){});
  //     } else {
  //       print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
  //       // Handle other HTTP errors if needed
  //     }
  //   }
  //   emit(ErrorLoginState());
  //
  // }

}
