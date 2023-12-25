import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = BlocProvider.of<AuthCubit>(context).userModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              IconlyLight.arrowLeft2,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Container(
                    width: SizeConfig.defaultSize * 10,
                    height: SizeConfig.defaultSize * 10,
                    decoration: BoxDecoration(
                      boxShadow:
                          BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme
                              ? []
                              : [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 5),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize * 5),
                      child: CachedNetworkImage(
                        imageUrl: userModel.avatar,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.userName.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        userModel.email,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(height: 40),
          Column(
            children: [
              ProfileSettingListView(
                title: userModel.userName,
                subTitle: 'Full Name',
              ),
              SizedBox(height: 20),
              ProfileSettingListView(
                title: userModel.email,
                subTitle: 'Email',
              ),
              SizedBox(height: 20),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return ProfileSettingListView(
                    subTitle: 'MOOD',
                    child: Switch(
                      value:
                          BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme,
                      onChanged: (value) {
                        BlocProvider.of<ThemeCubit>(context)
                            .setDarkTheme(themeValue: value);
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileSettingListView extends StatelessWidget {
  const ProfileSettingListView({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.child,
  });
  final String title;
  final String subTitle;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: child,
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
