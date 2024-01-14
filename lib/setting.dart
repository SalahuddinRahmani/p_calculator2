import 'package:flutter/material.dart';
import 'package:p_calculator2/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  var tec1 = TextEditingController();
  var tec2 = TextEditingController();

  num result4 = 0;
  num result3 = 0;
  num result2 = 0;
  num result1 = 0;

  num a=10;

  String text1="8 کیلو";
  String ttext="کیلو";

  num selectedValue2=1;
  int? selectedValue = 2;




  void text2(value) async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setDouble('1',tec1 as double );
    await prefs.setDouble('2',tec2 as double );

    setState(() {
      selectedValue = value;
    });
    if (selectedValue == 1) {
      text1 = "4کیلو";
      ttext="Kilo";
    } else if (selectedValue == 2) {
      text1 = "8کیلو";
      ttext="Kilo";
    }else if(selectedValue == 3){
      text1 = "1 من";
      ttext="من";
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("تنظیمات"),),

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
                        Text("تعین مقدار"),

                        RadioListTile(
                            title: Text("4کیلو"),
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: text2),
                        RadioListTile(
                            title: Text("8کیلو"),
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: text2),

                        RadioListTile(
                            title: Text("1 من"),
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
                        Text("تعین فیصد"),


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

