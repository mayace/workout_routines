import 'package:flutter/material.dart';
import "package:workout_routines/views/home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => Text("loading"),
        "/home": (context) => Home(),
        "/bruh": (context) => Text("bruh"),
      },
    );
  }
}
