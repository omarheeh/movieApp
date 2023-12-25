import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/validator.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_button.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/text_field_title.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class CustomSingUpForm extends StatefulWidget {
  const CustomSingUpForm({
    super.key,
  });

  @override
  State<CustomSingUpForm> createState() => _CustomSingUpFormState();
}

class _CustomSingUpFormState extends State<CustomSingUpForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController firstNameControler;
  late TextEditingController lastNameControler;
  late TextEditingController emailControler;
  late TextEditingController passwordControler;
  late TextEditingController confirmPasswordControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameControler = TextEditingController();
    lastNameControler = TextEditingController();
    emailControler = TextEditingController();
    passwordControler = TextEditingController();
    confirmPasswordControler = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameControler.dispose();
    lastNameControler.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    confirmPasswordControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          TextFieldTitle(title: 'FIRST NAME'),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'first name here',
            controller: firstNameControler,
            validator: (value) {
              return MyValidators.displayNamevalidator(value);
            },
          ),
          SizedBox(height: 28),
          TextFieldTitle(
            title: 'LAST NAME',
          ),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'last name here',
            controller: lastNameControler,
            validator: (value) {
              return MyValidators.displayNamevalidator(value);
            },
          ),
          SizedBox(height: 28),
          TextFieldTitle(title: 'EMAIL'),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'email here',
            controller: emailControler,
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
          ),
          SizedBox(height: 28),
          TextFieldTitle(title: 'PASSWORD'),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'password here',
            controller: passwordControler,
            validator: (value) {
              return MyValidators.passwordValidator(value);
            },
          ),
          SizedBox(height: 28),
          TextFieldTitle(title: 'CONFIRM PASSWORD'),
          SizedBox(height: 10),
          CustomTextField(
            hintText: 'confirm password here',
            controller: confirmPasswordControler,
            validator: (value) {
              return MyValidators.repeatPasswordValidator(
                value: value,
                password: passwordControler.text,
              );
            },
          ),
          SizedBox(height: 20),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSingupSucsess) {
                UserModel userModel =
                    BlocProvider.of<AuthCubit>(context).userModel!;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Done ${userModel.email}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                );
              } else if (state is AuthSingupFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              }
            },
            child: CustomButton(
              title: 'REGISTER',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).singup(
                    emailAddress: emailControler.text,
                    password: passwordControler.text,
                    firstName: firstNameControler.text,
                    lastName: lastNameControler.text,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
