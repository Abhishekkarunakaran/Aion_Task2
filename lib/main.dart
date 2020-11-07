import 'dart:convert';

import 'package:api_calling_app/loading_screen.dart';
import 'package:api_calling_app/result_screen.dart';
import 'package:api_calling_app/screensize.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "API Test",
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Map data;

  void fetchData() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/todos/1');
    if (response.statusCode==200) {
      data = jsonDecode(response.body);
      var title = data['title'];
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                dataIsHere: true,
                data: title,
              )));
    } else {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                dataIsHere: false,
                data: 'Error',
              )));
      print("didn't get the file");
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('API Test'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            //TODO
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Loading()));
            fetchData();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            height: size.height * .1,
            width: size.width * .5,
            child: Center(
                child: Text(
              'Get Data',
              style: TextStyle(
                fontSize: size.height * .03,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
