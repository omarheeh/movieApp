import 'package:flutter/material.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
        Expanded(
          child: Text(
            'Social Logins',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
