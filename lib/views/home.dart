import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:workout_routines/providers/workout.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List<Widget> getList(context) {
  return Provider.of<Workout>(context)
      .routines
      .map((item) => Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            Provider.of<Workout>(context, listen: false).remove(item);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$item")));
          },
          child: Card(
            child: ListTile(
              title: Text(item),
            ),
          )))
      .toList();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: getList(context)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          Provider.of<Workout>(context, listen: false).add("name");
        },
      ),
    );
  }
}
