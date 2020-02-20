import 'package:flutter/material.dart';

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
                  child: ReuseableCard(color: Color(0xFF1D1E33)),
                ),
                Expanded(
                  child: ReuseableCard(color: Color(0xFF1D1E33)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(color: Color(0xFF1D1E33)),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(color: Color(0xFF1D1E33)),
                ),
                Expanded(
                  child: ReuseableCard(color: Color(0xFF1D1E33)),
                ),
              ],
            ),
          )
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
