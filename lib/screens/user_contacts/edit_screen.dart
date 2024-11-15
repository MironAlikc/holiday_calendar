import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holiday_calendar/resources/colors_app.dart';
import 'package:holiday_calendar/widgets/custom_text_field_widget.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorsApp.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  // TextField(
                  //   controller: _titleController,
                  //   style: const TextStyle(color: Colors.black, fontSize: 30),
                  //   decoration: const InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: 'Title',
                  //       hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                  // ),
                  // TextField(
                  //   controller: _contentController,
                  //   style: const TextStyle(
                  //     color: Colors.black,
                  //   ),
                  //   maxLines: null,
                  //   decoration: const InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: 'Type something here',
                  //       hintStyle: TextStyle(
                  //         color: Colors.grey,
                  //       )),
                  // ),
                  const CustomTextFieldWidget(
                    labelText: 'Phone number',
                    hintText: '+38062 267 23 24',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const CustomTextFieldWidget(
                    labelText: 'Date of birth',
                    hintText: 'alexmarshall2022@gmail.com',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const CustomTextFieldWidget(
                    labelText: 'Birthday',
                    hintText: '08/01/2001',
                  ),
                  SizedBox(height: 24.h),
                  const CustomTextFieldWidget(
                    labelText: 'Email',
                    hintText: 'alexmarshall2022@gmail.com',
                  ),
                  TextField(
                    controller: _contentController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write a congratulation',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'http://ourserver.com/dist/image/user-1/request-1/1.png',
                      height: 40,
                      width: 40,

                      // fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
        },
        elevation: 10,
        backgroundColor: ColorsApp.mainColor,
        child: const Icon(Icons.save),
      ),
    );
  }
}
