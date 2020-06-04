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
  List<Widget> searchData = [];

  Icon cusSearchIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("CovidApp");
  Widget listall;

  TextEditingController controller = new TextEditingController();

  textChangedQuery(String text, List data) async{
    this.searchData.clear();
    if (text.isEmpty){
      setState(() {
      });
    }
    for(int i = 0;i < data.length; i++){
      String name = data[i]['CountryName'];
      if (name.contains(text)){
        this.searchData.add(new ButtonHome(location: data[i]['Country'], totalConfirmed: data[i][["TotalConfirmed"]]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    this.data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    this.dataGlobal = data['global'];
    this.location = "Global";

    Widget homeWidgets(data, index, includeGlobal, globalData){
      if (index == 0 && includeGlobal){
        return new ButtonHome(location: "Global", totalConfirmed: globalData['TotalConfirmed'], size: 40.0);
      }
      else{
        return new ButtonHome(location: data[index]["Country"], totalConfirmed: data[index]["TotalConfirmed"], size: 20.0);
      }
    }

    Widget ListAll(data, isGlobal, globalData){
      return ListView.separated(
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
          itemCount: isGlobal ? data.length + 1 :data.length ,
          itemBuilder: (context, index){
            return homeWidgets(data, index, isGlobal, globalData);
          }
      );
    }
    listall = ListAll(this.data['countries'], true, data['global']);
  //(this.data['countries'], index, true, data['global'])
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: cusSearchBar,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if(this.cusSearchIcon.icon == Icons.search){
                  this.cusSearchIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    controller: controller,
                    onChanged: textChangedQuery(controller.text, this.data['countries']),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Country",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      )
                    ),
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  );
                }
                else{
                  this.cusSearchIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("CovidApp");
                }
              });
            },
            icon: cusSearchIcon,
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: listall
//      ListView.separated(
//          separatorBuilder: (context, index) {
//            if (index == 0){
//              return Divider(
//                height: 4.0,
//              );
//            }
//            return Divider(
//              height: 1.0,
//            );
//          },
//          scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//          itemCount: data['countries'].length + 1,
//          itemBuilder: (context, index){
//            return homeWidgets(this.data['countries'], index, true, data['global']);
//          }
//      )
    );
  }
}

