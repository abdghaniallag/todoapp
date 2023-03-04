import 'package:flutter/material.dart';
import 'package:todoapp/ui/size_config.dart';
import 'package:todoapp/ui/theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.text,
      required this.note,
      this.controller,
      this.widget})
      : super(key: key);

  final String text;
  final String note;
  final TextEditingController? controller;
  final Widget? widget;

  get primaryClr => null;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text, 
              style: titleStyle,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: SizeConfig.screenWidth,
              height: 52,
              decoration: BoxDecoration(
                  color: primaryClr,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    autofocus: false,
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: note, hintStyle: subTitleStyle),
                  )),
                  widget ?? Container()
                ],
              ),
            ),
          ],
        ));
  }
}
