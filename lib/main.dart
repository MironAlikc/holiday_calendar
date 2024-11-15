import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/screens/auth/auth_widget.dart';
import 'package:holiday_calendar/screens/home_screen.dart';
import 'package:holiday_calendar/screens/splash_screen.dart';
import 'package:holiday_calendar/screens/user_contacts/edit_screen.dart';
import 'package:holiday_calendar/screens/user_contacts/user_info_screen.dart';
import 'package:holiday_calendar/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.bgColor,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.bgColor,
                elevation: 0,
              ),
            ),
            routes: <String, WidgetBuilder>{
              '/': (context) => const SplashScreen(),
              '/auth': (context) => const AuthWidget(),
              '/home_screen': (context) => const HomeScreen(),
              '/edit_screen': (context) => const EditScreen(),
              '/home_screen/user_info': (context) {
                final arguments = ModalRoute.of(context)?.settings.arguments;
                if (arguments is int) {
                  return UserInfoScreen(info: arguments);
                } else {
                  return const UserInfoScreen(info: 0);
                }
              },
            },
            initialRoute: '/',
          );
        });
  }
}
