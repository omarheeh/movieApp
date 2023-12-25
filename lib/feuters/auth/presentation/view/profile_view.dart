import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/auth/presentation/view/login_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/profile_view_body.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthsignOutSucsess) {
            Navigator.of(context).pushReplacementNamed(LoginView.id);
          } else if (state is AuthsignOutFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        child: ProfileViewBody(),
      ),
    );
  }
}
