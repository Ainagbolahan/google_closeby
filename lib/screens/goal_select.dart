import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/interests_data.dart';
import '../models/reusabe_card.dart';

enum GenderEnum {
  active,
  inactive,
}

class GoalSelect extends StatefulWidget {
  Widget buttonType;
  BuildContext context;

  GoalSelect({Key? key, required this.buttonType, required this.context})
      : super(key: key);

  @override
  State<GoalSelect> createState() => _GoalSelectState();
}

class _GoalSelectState extends State<GoalSelect> {
  GenderEnum? selectedGender;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.asset('assets/images/boy.png')),
            Text(
              'Excellent ${Provider.of<InterestsData>(context).interests[0].name}!',
              style: kHeaderStyle,
            ),
            const Text(
              'Can you tell us what your main goal to use this app is?',
              textAlign: TextAlign.center,
              style: kBodyStyle,
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              height: 60.0,
              color: Color(0XFFf5f9fb),
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderEnum.active;
                          });
                        },
                        cardChild: Text(
                          'Getting Service',
                          style: selectedGender == GenderEnum.active
                              ? kActiveButtonStyle
                              : kInActiveButtonStyle,
                        ),
                        colour: selectedGender == GenderEnum.active
                            ? kActiveCardColour
                            : kInActiveCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderEnum.inactive;
                          });
                        },
                        cardChild: Text(
                          'Want to be a tasker',
                          style: selectedGender == GenderEnum.inactive
                              ? kActiveButtonStyle
                              : kInActiveButtonStyle,
                        ),
                        colour: selectedGender == GenderEnum.inactive
                            ? kActiveCardColour
                            : kInActiveCardColour,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widget.buttonType,
          ],
        ),
      ),
    );
  }
}
