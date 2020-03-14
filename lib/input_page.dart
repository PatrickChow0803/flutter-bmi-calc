import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';

/*

  DIFFERENCE BETWEEN CONST AND FINAL

  CONST = IMMUTABLE VALUE THAT GETS ASSIGNED DURING COMPILATION TIME = MUST EQUAL TO A VALUE THAT ALREADY EXISTS
  FINAL = IMMUTABLE VALUE THAT GETS ASSIGNED DURING RUN TIME = MUST EQUAL A VALUE THAT GETS DEFINED WHILE APP IS RUNNING


 */

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
//  Color maleCardColor = INACTIVE_CARD_COLOR;
//  Color femaleCardColor = INACTIVE_CARD_COLOR;
//
//  void updateColor(Gender selectedGender) {
//    if (selectedGender == Gender.male) {
//      maleCardColor = ACTIVE_CARD_COLOR;
//      femaleCardColor = INACTIVE_CARD_COLOR;
//    } else {
//      maleCardColor = INACTIVE_CARD_COLOR;
//      femaleCardColor = ACTIVE_CARD_COLOR;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      // A column has 3 areas horizontally in my app. Therefore add 3 expanded widgets to the column.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            // A row has 2 areas vertically in my app. Therefore add 2 expanded widgets to the row.
            child: Row(
              children: <Widget>[
                Expanded(
//                  GestureDetector is used to detect when the user interacts with the child widget.
                  // ReuseableCard for the male card
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  // ReuseableCard for the female card
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // ReuseableCard for the weight slider
            child: ReuseableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
//                  textBaseline makes it so that the Text widgets are aligned to the bottom.
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // Active color is the color to the left of the thumb
                      activeColor: Color(0xFFEB1555),
                      // Inactive color is the color to the right of the thumb
                      inactiveColor: Color(0xFF8D8E98),
//                        newValue is the value that will be passed to me when the user interacts with the slider
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
