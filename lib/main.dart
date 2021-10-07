import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:watch/models/controller.dart';
import 'package:watch/screens/homepage.dart';



void main() => runApp(MyApp());



class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: AppController(),
      child: ScopedModelDescendant(
        builder: (context, child, AppController controller) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(controller),
          );
        }
      ),
    );
  }
}

// https://cdn.dribbble.com/users/3789593/screenshots/14234384/dribble__4x.png