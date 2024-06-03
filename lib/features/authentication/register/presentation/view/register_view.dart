import 'package:flutter/material.dart';
import 'package:road_map/features/authentication/register/presentation/view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(),
    );
  }
}
