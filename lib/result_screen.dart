import 'package:api_calling_app/main.dart';
import 'package:api_calling_app/screensize.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  bool dataIsHere;
  String data;

  Result({this.dataIsHere, this.data});

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Result'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: size.height * .5,
          width: size.width * .75,
          decoration: BoxDecoration(
              color: dataIsHere ? Colors.green : Colors.deepOrange,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            data,
            style: TextStyle(fontSize: size.height * .04),
          ),
        ),
      ),
    );
  }
}
