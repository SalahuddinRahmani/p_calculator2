import 'package:flutter/material.dart';

import 'package:p_calculator2/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpalahScreen(),
  ));
}

class SpalahScreen extends StatefulWidget {
  const SpalahScreen({super.key});
  @override
  State<SpalahScreen> createState() => _SpalahScreenState();
}

class _SpalahScreenState extends State<SpalahScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      // Navigator.push(context, MaterialPageRoute(builder: (bb) {
      //   return InputPage();
      // }));
    });
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset("images/sdsdsd (1).jpg",fit:BoxFit.cover
          ),



        ],
      ),
    );
  }
}
