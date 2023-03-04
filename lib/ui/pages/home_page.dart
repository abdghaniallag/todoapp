import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/services/theme_services.dart';
import 'package:todoapp/ui/pages/add_task_page.dart';
import 'package:todoapp/ui/size_config.dart';
import 'package:todoapp/ui/widgets/button.dart';

import '../theme.dart';
import '../widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBare(),
          SizedBox(
            height: 16,
          ),
          _addDateBare(),
          SizedBox(
            height: 16,
          ),
          _showTasks(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: IconButton(
          onPressed: (() {
            ThemeServices().switchTheme();
          }),
          icon: Icon(
            Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_outlined,
            color: Get.isDarkMode ? white : darkGreyClr,
          )),
      elevation: 0,
      actions: [
        Icon(
          Icons.info_outline,
          color: darkGreyClr,
        )
      ],
    );
  }

  _addTaskBare() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()).toString(),
                  style: subHadingStyle),
              Text(
                DateFormat.d().format(DateTime.now()).toString(),
                style: headingStyle,
              )
            ],
          ),
          MyButton(
            lable: 'Add Task',
            onTap: () {
              Get.to(const AddTaskPage());
            },
          )
        ],
      ),
    );
  }

  _addDateBare() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Column(
        children: [
          Row(
            children: [Text(' ')],
          )
        ],
      ),
    );
  }

  _showTasks() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 10),
      child: Column(
        children: [
          Row(
            children: [Text(' ')],
          )
        ],
      ),
    );
  }
}
