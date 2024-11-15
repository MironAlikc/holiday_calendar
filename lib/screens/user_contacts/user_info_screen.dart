import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/resources/colors_app.dart';
import 'package:holiday_calendar/widgets/custom_buttom_widget.dart';
import 'package:holiday_calendar/widgets/custom_circle_avatar_widget.dart';
import 'package:holiday_calendar/widgets/custom_text_field_widget.dart';

class UserInfoScreen extends StatefulWidget {
  final int info;
  const UserInfoScreen({super.key, required this.info});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String iamge =
        'https://www.shutterstock.com/shutterstock/photos/2366715295/display_1500/stock-photo-happy-person-with-dreadlocks-look-camera-male-hair-style-close-up-cute-brutal-smiling-man-face-2366715295.jpg';
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            highlightElevation: 120,
            backgroundColor: ColorsApp.mainColor,
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/edit_screen',
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Информация о пользователе'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomCircleAvatar(iamge: iamge),
                SizedBox(height: 40.h),
                const CustomTextFieldWidget(
                  labelText: 'Name',
                  hintText: 'Aleks Marshall',
                ),
                SizedBox(
                  height: 24.h,
                ),
                const CustomTextFieldWidget(
                  labelText: 'Username',
                  hintText: 'alex_marshall',
                ),
                SizedBox(
                  height: 24.h,
                ),
                const CustomTextFieldWidget(
                  labelText: 'Phone number',
                  hintText: '+38062 267 23 24',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 24.h,
                ),
                const CustomTextFieldWidget(
                  labelText: 'Birthday',
                  hintText: '08/01/2001',
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomButtomWidget(
                  title: 'Save',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
