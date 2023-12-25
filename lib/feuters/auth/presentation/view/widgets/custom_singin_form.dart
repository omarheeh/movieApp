import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/validator.dart';
import 'package:movies_app/feuters/auth/presentation/view/forgot_password_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_button.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/text_field_title.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class CustomSinginForm extends StatefulWidget {
  const CustomSinginForm({
    super.key,
  });

  @override
  State<CustomSinginForm> createState() => _CustomSinginFormState();
}

class _CustomSinginFormState extends State<CustomSinginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController passwordController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldTitle(
            title: 'EMAIL',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'email here',
            controller: emailController,
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
          ),
          const SizedBox(height: 30),
          const TextFieldTitle(
            title: 'PASSWORD',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'password here',
            controller: passwordController,
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
            suffix: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ForgotPasswordView.id);
              },
              child: const Text(
                'FORGOT?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          CustomButton(
              title: 'Login',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).singIn(
                    emailAddress: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              }),
        ],
      ),
    );
  }
}
