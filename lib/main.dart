import 'package:flutter/material.dart';
import 'package:insta/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: Scaffold(
          body: Text(
        'lets build instagram',
        style: TextStyle(color: Colors.white),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
