import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/utils/methods.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffix,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.prefixIcon,
  });
  final String? hintText;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: prefixIcon != null ? 5 : 20, top: 5, bottom: 5, right: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: Methods().ButtonShadow(context),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            child: suffix,
          )
        ],
      ),
    );
  }
}
