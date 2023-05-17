import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/constants/coolors.dart';
import 'package:recipe_app/custom/actual_theme.dart';
import 'package:recipe_app/screens/todo_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TodoPage(),
    );
  }
}
