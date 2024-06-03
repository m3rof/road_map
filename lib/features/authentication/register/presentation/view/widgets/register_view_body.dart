import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../component/component.dart';
import '../../../../../../resourses/color_manager.dart';
import '../../../../../../resourses/constants.dart';
import '../../../../../../resourses/styles.dart';
import '../../../../../../resourses/value_app.dart';
import '../../register_manager/register_cubit.dart';
import '../../register_manager/register_state.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterViewBody> {
  late TextEditingController username;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: PaddingManager.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: hightMedia(context: context, h: SizeManager.s_1)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style: StylesManager.welcomeLR,
                    ),
                  ),
                  SizedBox(
                    height: SizeManager.s20,
                  ),
                  Image(
                      image: NetworkImage(
                      'https://img.freepik.com/premium-vector/vector-illustration-register-now-speech-bubble-label_180786-180.jpg',
                      ),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover),
                  const SizedBox(
                    height: SizeManager.s30,
                  ),
                  textFieldSuffix(
                    textInputType: TextInputType.text,
                    controller: username,
                    label: 'Enter your full name',
                    validator: 'Enter your full name',
                  ),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  textFieldSuffix(
                      textInputType: TextInputType.emailAddress,
                      controller: email,
                      label: 'Enter your email',
                      validator: 'Enter your email'),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  textFieldSuffix(
                    textInputType: TextInputType.text,
                    controller: password,
                    label: 'Enter your password',
                    validator: 'Enter your password',
                    icons: IconButton(
                        onPressed: () {
                          cubit.changeVisibility();
                          cubit.changeIconVisibility();
                        },
                        icon: cubit.iconVisibility),
                    obsurce: cubit.visibility1,
                  ),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  textFieldSuffix(
                    textInputType: TextInputType.text,
                    controller: confirmPassword,
                    label: 'Confirm your Password',
                    validator: 'Confirm your password',
                    icons: IconButton(
                        onPressed: () {
                          cubit.changeVisibility2();
                          cubit.changeIconVisibility2();
                        },
                        icon: cubit.iconVisibility2),
                    obsurce: cubit.visibility2,
                  ),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.checkValidation(
                            context: context,
                            key: key,
                            emailController: email,
                            passwordController: password,
                            confirmController: confirmPassword,
                            userController: username);
                      },
                      child:  Text(
                        'Register',
                        style: StylesManager.buttonStyle,
                      )),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account',style: StylesManager.accountDont,),
                      SizedBox(width: SizeManager.s10,),
                      textButton('sign in',(){Navigator.pop(context);}),
                    ],
                  ),
                  const SizedBox(
                    height: SizeManager.s20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
