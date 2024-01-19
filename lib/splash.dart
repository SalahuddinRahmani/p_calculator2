import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


import 'package:p_calculator2/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'mod/person.g.dart';

void main()async{

  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  await Hive.openBox<Person>(HiveBoxes.personBox);
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
    Future.delayed(Duration(seconds: 6), () {
      Navigator.push(context, MaterialPageRoute(builder: (bb) {
        return InputPage();
      }));
    });
    return Scaffold(

      body: SafeArea(
        child: Align(
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
                      fontSize: 45.0,
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
            // Text(' 👍 خرید آسان',style: TextStyle(fontSize: 44,color: Colors.white,fontWeight: FontWeight.bold),)),
              Positioned(
                left: 99,
                right: 10,
                bottom: 15,
                  top: 280,
                  child: SizedBox(
                    width: 250.0,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 7.0,
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FlickerAnimatedText('👍 خرید آسان'),
                          // FlickerAnimatedText('👍 خرید آسان'),
                          // FlickerAnimatedText("👍 خرید آسان"),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
