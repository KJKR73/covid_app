import 'dart:convert';
import 'package:http/http.dart';

class DataApi{

  Map data;
  bool globalTrue;

  Future<void> getData() async{
    Response response = await get('https://api.covid19api.com/summary');
    Map data = jsonDecode(response.body);
    this.data = data;
    this.globalTrue = true;
    print("Data Loaded Successfully");
  }
}