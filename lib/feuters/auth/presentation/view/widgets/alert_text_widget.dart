import 'package:flutter/material.dart';

class AlertTextTile extends StatelessWidget {
  const AlertTextTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
          ),
          const SizedBox(width: 6),
          Text(title),
        ],
      ),
    );
  }
}
