import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var list = [1, 2, 3, 4];
    var widget_list =
        list.map<Widget>((item) => Text(item.toString())).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(children: widget_list),
      ),
    );
  }
}
