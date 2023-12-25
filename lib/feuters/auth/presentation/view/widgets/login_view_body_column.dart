import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/singin_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_singin_form.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_social_button.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/social_widget.dart';

class LoginViewBodyColumn extends StatelessWidget {
  const LoginViewBodyColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 60),
            const CustomSinginForm(),
            const SizedBox(height: 30),
            const SocialWidget(),
            const SizedBox(height: 20),
            const CustomSocialButton(),
            const SizedBox(height: 40),
            const Align(
              child: Text(
                'Don’t have an account?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SingupView.id);
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
