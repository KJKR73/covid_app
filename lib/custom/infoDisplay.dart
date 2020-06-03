import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  int data;
  String valueName;
  InfoWidget({this.data, this.valueName});
  @override
  _InfoWidgetState createState() => _InfoWidgetState(data: this.data, valueName: this.valueName);
}

class _InfoWidgetState extends State<InfoWidget> {
  int data;
  String valueName;
  _InfoWidgetState({this.data, this.valueName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("${this.valueName} : ${this.data}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}