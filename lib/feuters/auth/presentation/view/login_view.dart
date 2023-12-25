import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'loginview';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
