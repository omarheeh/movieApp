import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String id = 'forgotPasswordView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgotPasswordViewBody(),
    );
  }
}
