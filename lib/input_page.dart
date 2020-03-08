import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

/*

  DIFFERENCE BETWEEN CONST AND FINAL

  CONST = IMMUTABLE VALUE THAT GETS ASSIGNED DURING COMPILATION TIME = MUST EQUAL TO A VALUE THAT ALREADY EXISTS
  FINAL = IMMUTABLE VALUE THAT GETS ASSIGNED DURING RUN TIME = MUST EQUAL A VALUE THAT GETS DEFINED WHILE APP IS RUNNING


 */

const BOTTOM_CONTAINER_HEIGHT = 50.0;
const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const INACTIVE_CARD_COLOR = Color(0xFF111328);
const BOTTOM_CONTAINER_COLOR = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = INACTIVE_CARD_COLOR;
  Color femaleCardColor = INACTIVE_CARD_COLOR;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      maleCardColor = ACTIVE_CARD_COLOR;
      femaleCardColor = INACTIVE_CARD_COLOR;
    } else {
      maleCardColor = INACTIVE_CARD_COLOR;
      femaleCardColor = ACTIVE_CARD_COLOR;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      // A column has 3 areas horizontally in my app. Therefore add 3 expanded widgets to the column.
      body: Column(
        children: <Widget>[
          Expanded(
            // A row has 2 areas vertically in my app. Therefore add 2 expanded widgets to the row.
            child: Row(
              children: <Widget>[
                Expanded(
//                  GestureDetector is used to detect when the user interacts with the child widget.
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: ReuseableCard(
                      color: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReuseableCard(
                      color: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              color: ACTIVE_CARD_COLOR,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    color: ACTIVE_CARD_COLOR,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    color: ACTIVE_CARD_COLOR,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: BOTTOM_CONTAINER_COLOR,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            height: BOTTOM_CONTAINER_HEIGHT,
          ),
        ],
      ),
    );
  }
}
