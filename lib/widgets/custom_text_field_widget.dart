import 'package:flutter/material.dart';
import 'package:holiday_calendar/resources/colors_app.dart';
import 'package:holiday_calendar/theme/app_fonts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: AppFonts.s12w400,
        hintText: hintText,
        // fillColor: Colors.grey,
        hintStyle: AppFonts.s18w400.copyWith(
          color: Colors.black,
        ),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.mainColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.mainColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
