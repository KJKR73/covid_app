import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  List<Map> searchData;
  Map data;
  SearchBar({this.searchData, this.data});
  @override
  _SearchBarState createState() => _SearchBarState(searchData : this.searchData, data : this.data);
}

class _SearchBarState extends State<SearchBar> {
  List<Map> searchData;
  Map data;
  TextEditingController controller = TextEditingController();
  _SearchBarState({this.searchData, this.data});
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Card(
        color: Colors.blue,
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
              setState(() {
                this.controller.clear();
                onSearchTextChanged("");
              });
            },
          ),
        ),
      ),
    );
  }
}
