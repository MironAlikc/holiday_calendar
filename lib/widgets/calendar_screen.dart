import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  double _getContainerHeight(CalendarFormat format) {
    if (format == CalendarFormat.week) {
      return 100.w;
    } else if (format == CalendarFormat.twoWeeks) {
      return 100.w;
    } else {
      return 400.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 226, 226),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 229, 226, 226),
        title: const Text('Календарь'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 350.w,
              height: _getContainerHeight(format),
              child: TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime(1890),
                lastDay: DateTime(3050),
                headerVisible: true,
                shouldFillViewport: false,
                sixWeekMonthsEnforced: true,
                calendarFormat: format,
                onFormatChanged: (CalendarFormat format) {
                  setState(() {
                    format = format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {});
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                eventLoader: _getEventsfromDay,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    //color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    //color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  formatButtonTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  //leftChevronVisible: false,
                  //rightChevronVisible: false,
                  // headerPadding: const EdgeInsets.symmetric(
                  //   horizontal: 5.0,
                  //   vertical: 10.0,
                  // ),

                  titleTextStyle: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Кого седоня поздравляем',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: 5,
                  itemExtent: 130,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Container(
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
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            AdvancedAvatar(
                              // statusColor: Colors.deepOrange,
                              image: const AssetImage(
                                'assets/avatar.png',
                              ),
                              foregroundDecoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  // color: Colors.deepOrange.withOpacity(0.75),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Имя Фамилия ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Ден разжение',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Поздравление',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )

            // const SizedBox(height: 20),
            // Text('Список дел на ${focusedDay.toLocal()}',
            //     textAlign: TextAlign.center, style: AppFonts.w700s25),
            // const SizedBox(height: 20),
            // const Text(
            //   'Для удаления задачи свайпайте влево, для редактирования - вправо!',
            //   style: AppFonts.w400s18,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: ColorsApp.mainColor,
      //   onPressed: () {},
      //   child: const Icon(Icons.access_alarm_outlined),
      // ),
    );
  }
}

class Event {
  final String title;
  Event({required this.title});

  @override
  String toString() => title;
}
