import 'package:flutter/material.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_circle_button.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircleButton(
          icon: 'google-178-svgrepo-com.svg',
          onTap: () {},
        ),
        const SizedBox(width: 25),
        CustomCircleButton(
          icon: 'facebook-svgrepo-com.svg',
          onTap: () {},
        ),
      ],
    );
  }
}
