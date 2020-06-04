import 'package:flutter/material.dart';
import 'package:covid19app/custom/infoDisplay.dart';

class ButtonHome extends StatefulWidget {
  String location;
  int totalConfirmed;
  dynamic size;
  ButtonHome({this.location, this.totalConfirmed, this.size});
  @override
  _ButtonHomeState createState() => _ButtonHomeState(location: this.location, totalConfirmed: this.totalConfirmed, size: this.size);
}

class _ButtonHomeState extends State<ButtonHome> {
  String location;
  int totalConfirmed;
  dynamic size;
  _ButtonHomeState({this.location, this.totalConfirmed, this.size});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: (){
        Navigator.pushNamed(context, '/individual');
      } ,
      child: Row(
          children : <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text('${this.location}',
                      style: TextStyle(
                          fontSize: size,
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                new InfoWidget(data: totalConfirmed, valueName: 'TotalConfirmed'),
                SizedBox(height: 10)
              ],
            )
          ]
      ),
    );
  }
}
