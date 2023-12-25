import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/constents/app_colors.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';
import 'package:movies_app/feuters/auth/presentation/view/setting_view.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = BlocProvider.of<AuthCubit>(context).userModel!;
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              height: 60,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: AppColors.darkPrimary,
              child: CircleAvatar(
                radius: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(140),
                  child: CachedNetworkImage(
                    imageUrl: userModel.avatar,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userModel.userName.toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              userModel.email,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: const ListTile(
                      leading: Icon(
                        IconlyBold.profile,
                      ),
                      title: Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(SettingView.id);
                    },
                    child: const ListTile(
                      leading: Icon(
                        IconlyBold.setting,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    child: const ListTile(
                      leading: Icon(
                        IconlyBold.infoCircle,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AuthCubit>(context).signOut();
                    },
                    child: const ListTile(
                      leading: Icon(
                        IconlyBold.logout,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
