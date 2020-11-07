import 'package:flutter/material.dart';

class ScreenSize {
  var height;
  var width;

  ScreenSize(context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
