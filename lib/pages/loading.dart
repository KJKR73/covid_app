import 'package:flutter/material.dart';
import 'package:covid19app/services/covid_data_fetch.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map global;
  List countries;

  void setupData() async{
    DataApi instance = DataApi();
    await instance.getData();
    this.global = instance.data['Global'];
    this.countries = instance.data['Countries'];
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'global' : this.global,
      'countries' : this.countries
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )
      )
    );
  }
}
