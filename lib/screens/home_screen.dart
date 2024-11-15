import 'package:flutter/material.dart';
import 'package:holiday_calendar/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationBarWidget(),
    );
  }
}
