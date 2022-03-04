import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ApiModelClass extends StatefulWidget {
  const ApiModelClass({Key? key}) : super(key: key);
  @override
  _ApiModelClassState createState() => _ApiModelClassState();
}

class _ApiModelClassState extends State<ApiModelClass> {
  UserData() async {

    final result = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final jsonData = jsonDecode(result.body);
    print(result.body); // to print in  console
  }
  ApiData() async{
    final data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print('result ${data.body}');

  }
  @override
  Widget build(BuildContext context) {
   // UserData();
    ApiData();
    return Scaffold(

    );
  }
}
