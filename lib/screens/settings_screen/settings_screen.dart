import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/widgets/custom_circle_avatar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    String iamge =
        'https://www.shutterstock.com/shutterstock/photos/2366715295/display_1500/stock-photo-happy-person-with-dreadlocks-look-camera-male-hair-style-close-up-cute-brutal-smiling-man-face-2366715295.jpg';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профіль'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      // тен
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              //   clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  CustomCircleAvatar(iamge: iamge),
                  const SizedBox(height: 15),
                  const Text('Alekc'),
                  const SizedBox(height: 15),
                  const Text('+380 63 123 45 67'),
                  const SizedBox(height: 15),
                  const Text('20.11.2001'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const MenuWidget(),
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              // тен
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]),
      //   clipBehavior: Clip.hardEdge,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Мова застосунку'),
            SizedBox(height: 15),
            Icon(Icons.chevron_right_sharp)
          ],
        ),
      ),
    );
  }
}
