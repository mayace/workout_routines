import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_routines/providers/workout.dart';
import "package:workout_routines/views/home.dart";

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Workout())],
    child: MyApp(),
  ));
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
        "/home": (context) => Home(),
        "/bruh": (context) => Text("bruh"),
      },
    );
  }
}
