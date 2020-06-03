import 'package:flutter/material.dart';
import 'package:covid19app/custom/infoDisplay.dart';

class ButtonHome extends StatefulWidget {
  String location;
  int totalConfirmed;
  ButtonHome({this.location, this.totalConfirmed});
  @override
  _ButtonHomeState createState() => _ButtonHomeState(location: this.location, totalConfirmed: this.totalConfirmed);
}

class _ButtonHomeState extends State<ButtonHome> {
  String location;
  int totalConfirmed;
  _ButtonHomeState({this.location, this.totalConfirmed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.black,
      onPressed: (){} ,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children : <Widget>[
            Container(
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('${this.location}',
                  style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            new InfoWidget(data: totalConfirmed, valueName: 'TotalConfirmed'),
          ]
      ),
    );
  }
}
