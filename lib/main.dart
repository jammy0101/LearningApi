import 'package:api/UploadImageScreen.dart';
import 'package:api/example_five.dart';
import 'package:api/example_four.dart';
import 'package:api/example_three.dart';
import 'package:api/example_two.dart';
import 'package:api/homeScreen.dart';
import 'package:api/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:UploadImageScreen(),
    );
  }
}
