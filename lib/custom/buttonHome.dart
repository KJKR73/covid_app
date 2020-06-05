import 'package:flutter/material.dart';
import 'package:covid19app/custom/infoDisplay.dart';

class ButtonHome extends StatelessWidget {
  String location;
  int totalConfirmed;
  dynamic size;
  ButtonHome({this.location, this.totalConfirmed, this.size});
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Colors.white,
      onPressed: (){
        Navigator.pushNamed(context, '/individual');
      } ,
      child: new Row(
          children : <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 20),
                new Container(
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
                new SizedBox(height: 4),
                new InfoWidget(data: totalConfirmed, valueName: 'TotalConfirmed'),
                new SizedBox(height: 10)
              ],
            )
          ]
      ),
    );
  }
}
