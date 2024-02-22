import 'package:flutter/material.dart';

import '../../../../assets/constants/colors.dart';

class InTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final TextEditingController controller;

  const InTextField({super.key,
    required this.icon, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: textFieldBackgroundColor),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 44, vertical: 13.5),
          prefixIcon: Container(
              padding: const EdgeInsets.all(10),
              child: icon
          ),
          filled: true,
          fillColor: textFieldBackgroundColor,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: allPageTextColor),
        ),
      ),
    );
  }
}
