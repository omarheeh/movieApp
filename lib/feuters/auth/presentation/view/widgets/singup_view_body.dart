import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_back_icon.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_image_picker.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_singup_form.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class SingupViewBody extends StatelessWidget {
  const SingupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthSingupLoading,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CustomBackIcon(),
                    SizedBox(height: 10),
                    CustomImagePicker(),
                    SizedBox(height: 45),
                    CustomSingUpForm(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
