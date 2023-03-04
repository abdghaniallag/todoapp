import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({this.payload = '', Key? key}) : super(key: key);
  final String payload;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';
  @override
  void initState() {
    _payload = widget.payload;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() => Get.back), icon: Icon(Icons.arrow_back_ios)),
        elevation: 0, 
        title: Text(
          _payload.toString().split('|')[2],
          style:
              TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'data',
                  style: headingStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'reminder',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: !Get.isDarkMode ? darkGreyClr : Colors.grey[100]),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  color: primaryClr, borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.text_decrease,
                        size: 30,
                        color:   Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 30,
                            color:
                                Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _payload.toString().split('|')[0],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        size: 30,
                        color:   Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                 Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    _payload.toString().split('|')[1],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 30,
                        color:   Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                  Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    _payload.toString().split('|')[2],
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
