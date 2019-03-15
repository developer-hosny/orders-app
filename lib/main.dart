import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './pages/auth.dart';

void main(){
  final bool debugMode = false;

  debugPaintSizeEnabled = debugMode;
  debugPaintBaselinesEnabled = debugMode;
  debugPaintPointersEnabled = debugMode;

  runApp(MyApp());
  
  } 

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      title: 'Orders App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        
      ),
      home: AuthPage(),
    );
  }
}
