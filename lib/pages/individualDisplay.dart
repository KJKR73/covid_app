import 'package:covid19app/custom/infoDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayIndividual extends StatefulWidget {
  @override
  _DisplayIndividualState createState() => _DisplayIndividualState();
}

class _DisplayIndividualState extends State<DisplayIndividual> {

  Map data;
  String name;
  String flagUrl;

  @override
  Widget build(BuildContext context) {
    this.data = ModalRoute.of(context).settings.arguments;
    name = data['individual_data'].length > 6 ? data['individual_data']['Country'] : 'Global';
    flagUrl = data['individual_data'].length > 6 ? data['individual_data']['CountryCode'].toString().toLowerCase() + ".png" : 'global.jpg';//getFlagUrl(name);
    flagUrl = "assets/$flagUrl";
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("CovidData",
        style: TextStyle(
          fontSize: 24.0,
          letterSpacing: 2,
          fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Container(
                height: 150,
                width: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(flagUrl)
                  )
                ),
              ),
              SizedBox(height: 20),
              Text("$name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index){
                return SizedBox(height: 10);
              },
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 0){
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['TotalConfirmed'], valueName: "Total Confirmed", fontSize: 21.0));
                }
                else if (index == 1){
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['TotalDeaths'], valueName: "Total Deaths", fontSize: 21.0));
                }
                else if (index == 2){
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['NewConfirmed'], valueName: "New Confirmed", fontSize: 21.0));
                }
                else if (index == 3){
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['NewRecovered'], valueName: "New Recovered", fontSize: 21.0));
                }
                else if (index == 4){
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['NewDeaths'], valueName: "New Deaths", fontSize: 21.0));
                }
                else{
                  return Padding(padding : EdgeInsets.fromLTRB(6, 0, 6, 0),child: new InfoWidget(data: data['individual_data']['TotalRecovered'], valueName: "Total Recovered", fontSize: 21.0));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
