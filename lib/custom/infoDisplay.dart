import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  int data;
  String valueName;
  dynamic fontSize;
  InfoWidget({this.data, this.valueName, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("${this.valueName}",
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(" : ${this.data}",
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            SizedBox(height: 6)
          ],
        ),
      ),
    );
  }
}
