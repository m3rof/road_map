import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map/component/component.dart';
import 'package:road_map/component/constants.dart';
import 'package:road_map/features/authentication/login/presentation/login_manager/login_cubit.dart';
import 'package:road_map/features/authentication/login/presentation/login_manager/login_state.dart';
import 'package:road_map/features/authentication/register/presentation/view/register_view.dart';
import 'package:road_map/resourses/color_manager.dart';
import 'package:road_map/resourses/constants.dart';
import 'package:road_map/resourses/styles.dart';
import 'package:road_map/resourses/value_app.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController emailReset;
  late GlobalKey<FormState> key;
  late GlobalKey<FormState> keyReset;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    key = GlobalKey();
    keyReset = GlobalKey();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: hightMedia(context: context, h: SizeManager.s_1)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome back',
                      style: StylesManager.welcomeLR,
                    ),
                  ),
                  SizedBox(
                    height: SizeManager.s20,
                  ),
                  Image(
                      image: NetworkImage(
                        'https://static.vecteezy.com/system/resources/thumbnails/003/689/228/small/online-registration-or-sign-up-login-for-account-on-smartphone-app-user-interface-with-secure-password-mobile-application-for-ui-web-banner-access-cartoon-people-illustration-vector.jpg',
                      ),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  textFieldSuffix(
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      label: 'Enter your email',
                      validator: 'Enter your email'),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  textFieldSuffix(
                    textInputType: TextInputType.text,
                    controller: passwordController,
                    label: 'Enter your password',
                    validator: 'Enter your password',
                    icons: IconButton(
                        onPressed: () {
                          cubit.changeVisibility();
                          cubit.changeIconVisibility();
                        },
                        icon: cubit.iconVisibility),
                    obsurce: cubit.visibility,
                  ),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.checkValidation(
                            context: context,
                            key: key,
                            emailController: emailController,
                            passwordController: passwordController);
                      },
                      child: Text(
                        'Login',
                        style: StylesManager.buttonStyle,
                      )),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account',style: StylesManager.accountDont,),
                      SizedBox(width: SizeManager.s10,),
                      textButton('sign UP',(){moveScreen(context: context, screen: RegisterView());}),
                    ],
                  ),
                  SizedBox(height: SizeManager.s20,),
                  textButton('Forget Password', (){
                    resetPassword(context,emailReset,keyReset,cubit);
                  }),
                  SizedBox(height: SizeManager.s20,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

