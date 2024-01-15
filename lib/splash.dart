import 'package:flutter/material.dart';

import 'package:p_calculator2/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (bb) {
        return Main();
      }));
    });
    return Scaffold(

      backgroundColor: Color.fromRGBO(20,77,60,1),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 144, 176, 1.0),
              Color.fromRGBO(3, 44, 98, 1),
            ]),
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Center(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(child: Image.asset("images/fdsa.png",width:300,height:300,)),

                    Text(
                      textDirection: TextDirection.rtl,
                      " احادیث مختصر صحیح",
                      style: TextStyle(fontSize: 70, color: Colors.white,fontWeight: FontWeight.bold),
                    ),Text(
                      "از کتاب ",
                      style: TextStyle(fontSize: 70, color: Colors.white,),
                    ),Text(
                      " {  صحیح البخاری رح  }",
                      style: TextStyle(fontSize: 70, color: Colors.white,fontWeight: FontWeight.bold),
                    ),

                  ],
                )),
          ],
        ),
      ),
    );
  }
}
