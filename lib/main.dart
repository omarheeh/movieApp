import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constents/theme.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/core/serves/firebase_auth_serves.dart';
import 'package:movies_app/core/serves/firebase_firestore_serves.dart';
import 'package:movies_app/core/utils/git_it.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';
import 'package:movies_app/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:movies_app/feuters/auth/presentation/view/forgot_password_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/login_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/setting_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/singin_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/presentation/view/home_view.dart';
import 'package:movies_app/feuters/home/presentation/view_model/grid_movei/grid_movei_cubit.dart';
import 'package:movies_app/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:movies_app/feuters/page_navigator.dart';
import 'package:movies_app/feuters/save/data/save_ropo/save_repo_impl.dart';
import 'package:movies_app/feuters/save/presintation/view_model/save_cubit/save_cubit.dart';
import 'firebase_options.dart';

void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..getTheme(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GridMoveiCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl(
              FireBaseAuthServes(FirebaseAuth.instance),
              FirebaseFirestoreServes(FirebaseFirestore.instance))),
        ),
        BlocProvider(
          create: (context) => SaveCubit(SaveRepoImpl(getIt.get<ApiServes>(),
              FirebaseFirestoreServes(FirebaseFirestore.instance))),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          bool isDarkTheme =
              BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme;
          return MaterialApp(
            routes: RoutersList,
            theme: Style.themeData(isDartktheme: isDarkTheme, context: context),
            debugShowCheckedModeBanner: false,
            home: LoginView(),
          );
        },
      ),
    );
  }

  Map<String, WidgetBuilder> get RoutersList {
    return {
      SingupView.id: (context) => const SingupView(),
      ForgotPasswordView.id: (context) => const ForgotPasswordView(),
      HomeView.id: (context) => const HomeView(),
      PageNavigator.id: (context) => const PageNavigator(),
      LoginView.id: (context) => const LoginView(),
      LoginView.id: (context) => const LoginView(),
      SettingView.id: (context) => const SettingView(),
    };
  }
}
