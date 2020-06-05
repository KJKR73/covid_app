import 'package:covid19app/custom/buttonHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = new TextEditingController();
  Map data = {};
  String location;
  Map dataGlobal;
  List<Map> searchData = [];

  Widget _searchDataDisplay(){
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
        itemCount: searchData.length,
        itemBuilder: (context, i) {
          return new ButtonHome(location: searchData[i]["Country"], totalConfirmed: searchData[i]["TotalConfirmed"], size: 20.0);
        }
    );
  }

  Widget _allData(){
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
        itemCount: data['countries'].length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return new ButtonHome(location: "Global", totalConfirmed: dataGlobal['TotalConfirmed'], size: 40.0);
          }
          return new ButtonHome(location: data['countries'][index]["Country"], totalConfirmed: data['countries'][index]["TotalConfirmed"], size: 20.0);
        }
    );
  }

  Widget _buildBody(){
    return new SafeArea(
      child: Column(
        children: <Widget>[
           new Padding(
            padding: EdgeInsets.all(0.0),
            child: Card(
              color: Colors.red,
              child: ListTile(
                leading: Icon(Icons.search, color: Colors.white),
                title: TextField(
                  onChanged: onSearchTextChanged,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontSize: 20
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Country",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 20
                      )
                  ),
                ),
                trailing: IconButton(
                  icon: new Icon(Icons.cancel, color: Colors.white),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged("");
                  },
                ),
              ),
            ),
          ),
          new Expanded(
              child: searchData.length != 0 || controller.text.isNotEmpty
                  ? _searchDataDisplay()
                  : _allData()
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    dataGlobal = data['global'];
    location = "Global";
    return new Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody()
    );
  }
  onSearchTextChanged(String text) async{
    searchData.clear();
    if (text.isEmpty){
      setState(() {});
      return;
    }
    else{
      data['countries'].forEach((post) {
        if (post['Country'].contains(text)) {
          searchData.add(post);
        }
      });
      setState(() {});
    }
  }
}