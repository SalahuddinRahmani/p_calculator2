import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


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
      Navigator.push(context, MaterialPageRoute(builder: (bb) {
        return InputPage();
      }));
    });
    return Scaffold(

      body: Align(
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset("images/sdsdsd (1).jpg",fit:BoxFit.cover
            ),



            Positioned(
              top: 200,
              bottom: 55,
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.red,
                child: Text(
                  ' ❤  خوش آمدید  ❤',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),



            Positioned(
              bottom: 10,
              top:200 ,

              child: Container(

                  height:300,
                  width:300,
                  child: Image.asset(height: 50,width: 50,"images/pistachio_PNG37.png")),
            ),

            Positioned(
              left: 44,
              right: 10,
              bottom: 15,
                top: 280,
                child: Text(' 👍 خرید آسان',style: TextStyle(fontSize: 44,color: Colors.white,fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}
