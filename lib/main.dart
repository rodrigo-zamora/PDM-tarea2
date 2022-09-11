// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tip_time_base/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
