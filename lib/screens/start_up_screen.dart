import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class InitialPage extends StatelessWidget {
  int number;
  String title;
  String description;
  Widget buttonType;

  InitialPage(
      {Key? key,
      required this.number,
      required this.title,
      required this.description,
      required this.buttonType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 100.0,
              height: 100.0,
            ),
          ],
        ),
        Expanded(child: Image.asset('assets/images/nb$number.jpg')),
        Text(
          title,
          style: kHeaderStyle,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        ),
        buttonType,
      ],
    );
  }
}
