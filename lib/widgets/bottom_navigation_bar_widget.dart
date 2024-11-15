import 'package:flutter/material.dart';
import 'package:holiday_calendar/resources/colors_app.dart';
import 'package:holiday_calendar/screens/settings_screen/settings_screen.dart';
import 'package:holiday_calendar/screens/user_contacts/contacts_scren.dart';
import 'package:holiday_calendar/screens/user_contacts/%D1%81ongratulation_screen.dart';
import 'package:holiday_calendar/widgets/calendar_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CalendarScreen(),
    const ContactsScren(),
    const CongratulationScreen(),
    Container(color: Colors.grey),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<IconData> data = [
      Icons.folder_open,
      Icons.notes_rounded,
      Icons.track_changes,
      Icons.note_alt_outlined,
      Icons.person_outline_sharp,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Material(
          // elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: ColorsApp.mainColor,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    if (_selectedIndex == i) return;
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 40,
                    decoration: BoxDecoration(
                      border: i == _selectedIndex
                          ? const Border(
                              top: BorderSide(
                                width: 3.0,
                                color: Colors.white,
                              ),
                            )
                          : null,
                      gradient: i == _selectedIndex
                          ? LinearGradient(
                              colors: [
                                  Colors.grey.shade700,
                                  const Color(0xFF0abab5)
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null,
                    ),
                    child: Icon(
                      data[i],
                      size: 35,
                      color: i == _selectedIndex
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }
}
