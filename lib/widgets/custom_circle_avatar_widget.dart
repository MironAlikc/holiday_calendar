import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/resources/colors_app.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.iamge,
  });
  final String iamge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsApp.mainColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 74.r,
          backgroundImage: NetworkImage(iamge),
        ),
      ),
    );
  }
}
