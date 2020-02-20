import 'package:flutter/material.dart';

/*

  DIFFERENCE BETWEEN CONST AND FINAL

  CONST = IMMUTABLE VALUE THAT GETS ASSIGNED DURING COMPILATION TIME = MUST EQUAL TO A VALUE THAT ALREADY EXISTS
  FINAL = IMMUTABLE VALUE THAT GETS ASSIGNED DURING RUN TIME = MUST EQUAL A VALUE THAT GETS DEFINED WHILE APP IS RUNNING


 */

const BOTTOM_CONTAINER_HEIGHT = 80.0;
const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const BOTTOM_CONTAINER_COLOR = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReuseableCard(color: ACTIVE_CARD_COLOR),
                ),
                Expanded(
                  child: ReuseableCard(color: ACTIVE_CARD_COLOR),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(color: ACTIVE_CARD_COLOR),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(color: ACTIVE_CARD_COLOR),
                ),
                Expanded(
                  child: ReuseableCard(color: ACTIVE_CARD_COLOR),
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

// Card that displays information on the screen
class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
//        Use decoration to give boxes a rounded edge
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
