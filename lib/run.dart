import 'package:flutter/material.dart';
import 'package:p_calculator2/list.dart';
import 'package:p_calculator2/main.dart';
import 'package:p_calculator2/splash.dart';


void main(){
 runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
   home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (bb) {
        return InputPage();
      }));
    });
    return
       Scaffold();

  }
}