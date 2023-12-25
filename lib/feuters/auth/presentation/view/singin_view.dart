import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/singup_view_body.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});
  static const String id = 'singupView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingupViewBody(),
    );
  }
}
