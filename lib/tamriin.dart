import 'package:flutter/material.dart';
import 'package:p_calculator2/setting.dart';

void main(){
  runApp(MaterialApp(home: Setting(

  )));
}

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  var tec1 = TextEditingController();
  var tec2 = TextEditingController();

  num result4 = 0;
  num result3 = 0;
  num result2 = 0;
  num result1 = 0;

  num a=10;

  String text1="8 kilo";
  String ttext="kilo";

  num selectedValue2=1;
  int? selectedValue = 2;
  String textf="10 %";




  void fisad(value2) {
    setState(() {
      selectedValue2 = value2;


    });
    if (selectedValue2 == 1) {
      textf="10 %";
      a=10;
    } else if (selectedValue2 == 2) {
      a=5;
      textf="20 %";
    }else if(selectedValue2 == 3){
      a=10/3;
      textf="30 %";
    }

    num n1 = num.parse(tec1.text);
    num n2 = num.parse(tec2.text);

    if (selectedValue == 2) {
      result1 = (n1 / 8) * n2;
    }

    if (selectedValue == 1) {
      result1 = (n1 / 4) * n2;
    }

    if (selectedValue == 3) {
      result1 = n1 * n2;
    }

    result2 = result1 / a; //بول عشر

    result3 = result1 - result2;


  }
//ببب






  void text2(value) {
    setState(() {
      selectedValue = value;
    });
    if (selectedValue == 1) {
      text1 = "4kg";
      ttext="Kilo";
    } else if (selectedValue == 2) {
      text1 = "8kg";
      ttext="Kilo";
    }else if(selectedValue == 3){
      text1 = "1 Man";
      ttext="Man";
    }

    //
    num n1 = num.parse(tec1.text);
    num n2 = num.parse(tec2.text);

    if (selectedValue == 2) {
      result1 = (n1 / 8) * n2;
    }

    if (selectedValue == 1) {
      result1 = (n1 / 4) * n2;
    }

    if (selectedValue == 3) {
      result1 = n1 * n2;
    }

    result2 = result1 / a; //بول عشر
    result3 = result1 - result2; //بول مشتری
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),

      body: Column(

        children: [
          Padding(
            padding:  EdgeInsets.all(15),
            child: Column(
              children: [

                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10),
                    child: Column(

                      children: [
                        Text("hhjhjhkjdfkjdfkjdfj"),

                        RadioListTile(
                            title: Text("4kg"),
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: text2),
                        RadioListTile(
                            title: Text("8kg"),
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: text2),

                        RadioListTile(
                            title: Text("1 Man"),
                            value: 3,
                            groupValue: selectedValue,
                            onChanged: text2),

                      ],),
                  ),
                ),



              ],
            ),
          ), Padding(
            padding:  EdgeInsets.all(15),
            child: Column(
              children: [

                Container(
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10),
                    child: Column(

                      children: [
                        Text("hhjhjhkjdfkjdfkjdfj"),



                        RadioListTile(
                            title: Text("10 %"),
                            value: 1,
                            groupValue: selectedValue2,
                            onChanged: fisad),

                        RadioListTile(
                            title: Text("20 %"),
                            value: 2,
                            groupValue: selectedValue2,
                            onChanged: fisad),

                        RadioListTile(
                            title: Text("30 %"),
                            value: 3,
                            groupValue: selectedValue2,
                            onChanged: fisad),



                      ],),
                  ),
                ),



              ],
            ),
          ),

          //تایین فیصد
          Column()
        ],
      ),
    );
  }
}

