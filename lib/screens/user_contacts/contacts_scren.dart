import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/resources/colors_app.dart';

class UserInfo {
  final int id;
  final String imageName;
  final String title;
  final String telephone;
  final String time;
  final String description;

  UserInfo({
    required this.id,
    required this.imageName,
    required this.title,
    required this.telephone,
    required this.time,
    required this.description,
  });
}

class ContactsScren extends StatefulWidget {
  const ContactsScren({super.key});

  @override
  State<ContactsScren> createState() => _ContactsScrenState();
}

class _ContactsScrenState extends State<ContactsScren> {
  final _user = [
    UserInfo(
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 1,
      telephone: '097 400 98 405',
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 2,
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения! ',
      id: 3,
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 4,
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 5,
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 6,
    ),
    UserInfo(
      telephone: '097 400 98 405',
      imageName: 'assets/avatar.png',
      title: 'Иван Иваныч',
      time: '12 октября 1989',
      description: 'Сердечно поздравляю Вас с днем рождения!',
      id: 7,
    ),
  ];
  var _filteredUser = <UserInfo>[];

  @override
  void initState() {
    super.initState();

    _filteredUser = _user;
  }

  void _onUserTap(int index) {
    final id = _user[index].id;
    Navigator.of(context).pushNamed(
      '/home_screen/user_info',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Контакты'),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 50,
        child: FloatingActionButton(
          highlightElevation: 120,
          backgroundColor: ColorsApp.mainColor,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredUser.length,
        itemExtent: 140.w,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredUser[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        AdvancedAvatar(
                          // statusColor: Colors.deepOrange,
                          image: AssetImage(movie.imageName),
                        ),
                        // TextAvatar(
                        //   size: 60,
                        //   shape: Shape.Circular,
                        //   text: 'FV',
                        // ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                movie.telephone,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.description,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _onUserTap(index),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
