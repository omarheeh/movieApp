import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_back_icon.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_button.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/text_field_title.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomBackIcon(),
            const Spacer(
              flex: 2,
            ),
            Image.asset('assets/images/logo.png'),
            const Spacer(),
            const Text(
              'FORGOT PASSWORD?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Enter the email address you used to create your account and we will email you a link to reset your password",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const TextFieldTitle(title: 'EMAIL'),
            const SizedBox(height: 10),
            const CustomTextField(
              hintText: 'email here',
            ),
            const SizedBox(height: 25),
            const CustomButton(title: 'SEND EMAIL'),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
