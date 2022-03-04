import 'dart:convert';

import 'package:apicalling/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class NewApiCalling extends StatefulWidget {
  const NewApiCalling({Key? key}) : super(key: key);

  @override
  _NewApiCallingState createState() => _NewApiCallingState();
}

final textController = TextEditingController();
final textControllerP=TextEditingController();

class _NewApiCallingState extends State<NewApiCalling> {

validate() async{
  final res= await post(Uri.parse('https://reqres.in/api/login'),
      body:{'email': textController.text,'password':textControllerP.text});
  print(res.body);
  final result = jsonDecode(res.body);
  if(result['error']=="user not found")
    {Fluttertoast.showToast(msg: 'not found');}else{
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()));}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(),
                  Container(
                    height: 400,
                    width: 400,
                    color: Colors.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(height: 40,width: 100,color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Login',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        TextField(controller: textController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)),
                                labelText: ('Email'),
                                border: OutlineInputBorder(),
                                hintText: ('enter email'))),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(controller: textControllerP,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: ('Password'),
                            border: OutlineInputBorder(),
                            hintText: ('Password'),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onSurface: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 10,
                                minimumSize: Size(10, 50)),
                            onPressed: ()
                            {print(textController.text);
                            print(textControllerP.text);
                            validate();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}