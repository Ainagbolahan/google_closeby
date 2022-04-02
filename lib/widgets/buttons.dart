import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFf5f9fb),
          border: Border.all(
            color: Color(0Xfff5f7fb),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        height: 40.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Get Started', style: kButtonTextStyle),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    size: 12.0,
                    color: Colors.black,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF6d9bea),
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            'Continue',
          ),
        ),
      ),
    );
  }
}
