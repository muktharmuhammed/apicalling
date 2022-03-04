import 'dart:convert';

import 'package:apicalling/modelapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ShowApi extends StatefulWidget {
  const ShowApi({Key? key}) : super(key: key);

  @override
  _ShowApiState createState() => _ShowApiState();
}

class _ShowApiState extends State<ShowApi> {
  Future<List<udata>?> ApiFunctn() async{
    final result = await http.get(
        Uri.parse("https://dummyapi.io/data/v1/user?limit=10"),
        headers: {"app-id": "61dbf9b1d7efe0f95bc1e1a6"});
    final jsonData = jsonDecode(result.body);
    print(result.body);
    List<udata>? data = ApiData.fromJson(jsonData).data;
    return data;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }
}
