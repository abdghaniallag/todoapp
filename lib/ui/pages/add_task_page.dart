import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/controllers/task_controller.dart';
import 'package:todoapp/ui/theme.dart';

import '../../services/theme_services.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TaskController taskController = Get.put(TaskController());
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _notecontroller = TextEditingController();
  int _selectedReminder = 5;
  int _selectedColor = 0;
  String _selectedRepeat = 'none';
  DateTime _selectedDate = DateTime.now();
  String _startTinme = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTinme = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  List<int> reminderList = [5, 10, 15, 20];
  List<String> repeatList = ['none', 'Daily', 'Weekly', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                text: 'Title',
                note: 'Enter Something',
                controller: _titlecontroller,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                text: 'Note',
                note: 'Enter Something',
                controller: _titlecontroller,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                text: 'Date',
                note: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  onPressed: () {},
                ),
                controller: _titlecontroller,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      text: 'Start Time',
                      note: DateFormat.yMd().format(_selectedDate),
                      widget: IconButton(
                        icon: Icon(Icons.access_time_rounded),
                        onPressed: () {},
                      ),
                      controller: _titlecontroller,
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      text: 'End Time',
                      note: DateFormat.yMd().format(_selectedDate),
                      widget: IconButton(
                        icon: Icon(Icons.access_time_rounded),
                        onPressed: () {},
                      ),
                      controller: _titlecontroller,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                  text: 'Remander',
                  note: '$_selectedReminder minites early',
                  widget: DropdownButton(
                    items: reminderList
                        .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              '$value',
                              style: TextStyle(color: Colors.black),
                            )))
                        .toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    underline: SizedBox(height: 0),
                    onChanged: ((value) {
                      setState(() {
                        _selectedReminder = value ?? 5;
                      });
                    }),
                  )),
              SizedBox(
                height: 20,
              ),
              InputField(
                  text: 'Repeat',
                  note: _selectedRepeat,
                  widget: DropdownButton(
                    items: repeatList
                        .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(
                              '$value',
                              style: TextStyle(color: Colors.black),
                            )))
                        .toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    underline: SizedBox(height: 0),
                    onChanged: ((value) {
                      setState(() {
                        _selectedRepeat = value ?? 'None';
                      });
                    }),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Color'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = 0;
                                });
                              },
                              child: Icon(
                                _selectedColor == 0
                                    ? Icons.circle_rounded
                                    : Icons.circle_outlined,
                                color: primaryClr,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = 1;
                                });
                              },
                              child: Icon(
                                _selectedColor == 1
                                    ? Icons.circle_rounded
                                    : Icons.circle_outlined,
                                color: pinkClr,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = 2;
                                });
                              },
                              child: Icon(
                                _selectedColor == 2
                                    ? Icons.circle_rounded
                                    : Icons.circle_outlined,
                                color: orangeClr,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  MyButton(lable: 'Creat Task', onTap: creatTask)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  creatTask() {
    Get.back();
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: IconButton(
          onPressed: (() { Get.back();
          }),
          icon: Icon(
            Icons.arrow_back_ios,
            color: darkGreyClr,
          )),
      elevation: 0,
      actions: [Icon(Icons.info_outline,color: darkGreyClr ,)],
    );
  }
}
