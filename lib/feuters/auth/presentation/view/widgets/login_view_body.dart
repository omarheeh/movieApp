import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/login_background_image.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/login_view_body_column.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:movies_app/feuters/home/presentation/view_model/grid_movei/grid_movei_cubit.dart';
import 'package:movies_app/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:movies_app/feuters/page_navigator.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LoginBackgroundImage(),
        SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSinginSucsess) {
                Navigator.of(context).pushNamed(PageNavigator.id);
                BlocProvider.of<HomeCubit>(context).getNews();
                BlocProvider.of<GridMoveiCubit>(context)
                    .getMoviesOnLoadingPage();
              }
              if (state is AuthSingupFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is AuthSinginLoading,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: LoginViewBodyColumn(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
