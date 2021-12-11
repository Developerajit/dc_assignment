import 'package:flutter/material.dart';

import 'Pages/Dashboard.dart';
void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'D & C',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Dashboard(),
    );
  }
}


