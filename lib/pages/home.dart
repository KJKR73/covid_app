import 'package:covid19app/custom/buttonHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  String location;
  Map dataGlobal;

  @override
  Widget build(BuildContext context) {
    this.data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    this.dataGlobal = data['global'];
    this.location = "Global";

    Widget homeWidgets(index){
      if (index == 0){
        return new ButtonHome(location: location, totalConfirmed: dataGlobal['TotalConfirmed'], size: 40.0);
      }
      else{
        return new ButtonHome(location: data['countries'][index]["Country"], totalConfirmed: data['countries'][index]["TotalConfirmed"], size: 20.0);
      }
    }

//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Container(
//              color: Colors.red[500],
//              child: Container(
//                padding: EdgeInsets.only(top: MediaQuery
//                    .of(context)
//                    .padding
//                    .top),
//                height: 90.0,
//                child: Center(
//                  child: Text("CovidData",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 30,
//                        letterSpacing: 2.0,
//                        color: Colors.blue[920],
//                    ),
//                  ),
//                )
//              ),
//            ),
//          SizedBox(height: 40),
//          ListView.builder(
//              scrollDirection: Axis.vertical,
//              shrinkWrap: true,
//              itemCount: data['countries'].length,
//              itemBuilder: (context, index){
//                return Text("dsd");
//              }
//          ),
//        ],
//      ),
//      );
//  }
//}

    return Scaffold(
      appBar: AppBar(
        title: Text("CovidApp"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[900],
      body: ListView.separated(
            separatorBuilder: (context, index) {
              if (index == 0){
                return Divider(
                  height: 4.0,
                );
              }
              return Divider(
                height: 1.0,
              );
            },
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data['countries'].length,
            itemBuilder: (context, index){
              return homeWidgets(index);
            }
        ),
    );
  }
}

