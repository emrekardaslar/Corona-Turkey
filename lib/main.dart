import 'package:flutter/material.dart';
import 'navbar_controller.dart';


void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationBarController(),
    );
  }
}
  