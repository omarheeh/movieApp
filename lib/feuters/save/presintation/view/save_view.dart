import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:movies_app/feuters/save/presintation/view/widgets/save_view_body.dart';
import 'package:movies_app/feuters/save/presintation/view_model/save_cubit/save_cubit.dart';

class SaveView extends StatefulWidget {
  const SaveView({super.key});

  @override
  State<SaveView> createState() => _SaveViewState();
}

class _SaveViewState extends State<SaveView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String userEmail = BlocProvider.of<AuthCubit>(context).userModel!.email;
    BlocProvider.of<SaveCubit>(context).getMovies(userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Saved',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: SaveViewBody(),
    );
  }
}
