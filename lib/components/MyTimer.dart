import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTimer extends StatelessWidget {
  final int time;
  final Color color;

  MyTimer({Key key, this.time = 0, this.color = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        color: this.color,
        alignment: Alignment.center,
        child: Text(
          "$time",
          style: TextStyle(fontSize: 145),
        ));
  }
}
