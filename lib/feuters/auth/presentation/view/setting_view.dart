import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  static const String id = 'settingView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingViewBody(),
    );
  }
}
