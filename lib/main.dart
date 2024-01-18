import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aboutPage.dart';
import 'package:p_calculator2/taiin maghz.dart';
import 'list.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Table App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: InputPage(),
    );
  }
}


class DataModel {
  String name;
  String fatherName;
  int integer;
  int integer2;

  DataModel({required this.name, required this.fatherName, required this.integer, required this.integer2});
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}



class _InputPageState extends State<InputPage> {


  ///////////////

/////////////////

  String name1 = " نام ";
  num a = 10;

  Color color = Colors.white;
  bool isTextEditabl = true;
  bool isTickMarkVisible = false;

  int value = 0;
  String text1 = "8 کیلو ";

  // تعیین مقدار
  String ttext = " کیلو";
  String Nnerkh = " نرخ";
  void text2(value) {
    setState(() {
      selectedValue = value;
    });
    if (selectedValue == 1) {
      text1 = "4 کیلو";
      ttext = "4 کیلو";
    } else if (selectedValue == 2) {
      text1 = "8 کیلو";
      ttext = "8 کیلو";
    } else if (selectedValue == 3) {
      text1 = "1 من";
      ttext = "1 من";
    }

    //
    num n1 = num.parse(nerkh.text);
    num n2 = num.parse(kilo.text);

    if (selectedValue == 2) {
      result1 = (n1 / 8) * n2;
    }
    if (selectedValue == 1) {
      result1 = (n1 / 4) * n2;
    }
    if (selectedValue == 3) {
      result1 = n1 * n2;
    }
    result2 = result1 / 10; //پول عشر
    result3 = result1 - result2; //پول مشتری
  }

  // ////  پاک کردن نرخ و کیلو
  // void _clearText() {
  //   String currentText = kilo.text;
  //   if (currentText.isNotEmpty) {
  //     String updatedText = currentText.substring(0, currentText.length - 1);
  //     kilo.text = updatedText;
  //   }
  // }
  //
  // void clearText() {
  //   String currentText = nerkh.text;
  //   if (currentText.isNotEmpty) {
  //     String updatedText = currentText.substring(0, currentText.length - 1);
  //     nerkh.text = updatedText;
  //   }
  // }
  //
  // /////  پاک کردن حروف نام و نام بدر
  // void clearText1() {
  //   String currentText = names.text;
  //   if (currentText.isNotEmpty) {
  //     String updatedText = currentText.substring(0, currentText.length - 1);
  //     names.text = updatedText;
  //   }
  // }
  //
  // void clearText2() {
  //   String currentText = fname.text;
  //   if (currentText.isNotEmpty) {
  //     String updatedText = currentText.substring(0, currentText.length - 1);
  //     fname.text = updatedText;
  //   }
  // }

  var names = TextEditingController();
  var fname = TextEditingController();
  var nerkh = TextEditingController();
  var kilo = TextEditingController();
  num result4 = 0;
  num result3 = 0;
  num result2 = 0;
  num result1 = 0;
  int? selectedValue = 2;

  void dispose() {
    kilo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      // backgroundColor: Color.fromRGBO(7, 57, 65, 1),
      drawer: Drawer(
        backgroundColor: Colors.amber[100],
        child: ListView(
          children: [
            //لیست
            Container(
              decoration: BoxDecoration(color:  Color.fromRGBO(255, 200, 100, 1),
      ),

              child: ListTile(
                onTap: () async{
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  List<String> savedData = prefs.getStringList('data') ?? [];

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TablePage(savedData: savedData)),
                  );
                },
                leading: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.import_contacts_outlined,
                      size: 30,
                      color: Colors.blueAccent,
                    )),
                title: Text(
                  textDirection: TextDirection.rtl,
                  "لیست",
                  style: TextStyle(fontSize: 30, color: Colors.black87),
                ),
              ),
            ),

            //تعیین مغز
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(254, 220, 110, 1)),

              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Maghz();
                  }));
                },
                leading: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                      color: Colors.blueAccent,
                    )),
                title: Text(
                  textDirection: TextDirection.rtl,
                  "تعین قیمت مغز",
                  style: TextStyle(fontSize: 25, color:Colors.black87),
                ),
              ),
            ),

            //AboutPage
            Container(
              decoration: BoxDecoration(color:Color.fromRGBO(255, 200, 100, 1)),
              child: ListTile(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AboutPage();
                    }));
                  });
                },
                leading: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.badge_outlined,
                      size: 35,
                      color: Colors.blue,
                    )),
                title: Text(
                  textDirection: TextDirection.rtl,
                  "About Page",
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                ),
              ),
            ),

            //بیرون شدن از برنامه
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(254, 220, 110, 1)),
              child: ListTile(

                onTap: () {

                  showDialog(
                      context: context, builder: (context){
                    return AlertDialog(
                      backgroundColor:Color.fromRGBO(254, 220, 110, 1),
                      title: Text("میخواهید از برنامه بیرون شوید؟",style: TextStyle(color: Colors.black87),),
                      actions: [
                        MaterialButton(color: Colors.red,onPressed: (){
                          Navigator.pop(context);
                        },child: Text("نخیر",style: TextStyle(color: Colors.white,fontSize: 20),),),
                        MaterialButton(color: Colors.green[800],onPressed: (){
                          exit(0);
                        },child: Text("بلی",style: TextStyle(color: Colors.white,fontSize: 20),),),
                      ],
                    );
                  });
                },
                leading: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 35,
                      color: Colors.red,
                    )),
                title: Text(
                  textDirection: TextDirection.rtl,
                  "بیرون شدن از برنامه",
                  style: TextStyle(fontSize: 25, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
      ///////////////////////////////////////////////////////////
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        centerTitle: true,
        title: Text(
          textDirection: TextDirection.rtl,
          "ماشین حساب P",
          style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w900, fontSize: 20),
        ),
        actions: [
          //////////////
          Padding(
            padding: EdgeInsets.only(right: 2.0, top: 3),
            child: Text(
              text1,textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.white70,fontSize: 25),
            ),
          ),

          PopupMenuButton(
          color: Colors.amber[100],
              onSelected: (Value) {},
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: RadioListTile(
                      title: Text("4 کیلو",textDirection: TextDirection.rtl,),
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: text2),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                      title: Text("8 کیلو",textDirection: TextDirection.rtl,),
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: text2),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                      title: Text(" من",textDirection: TextDirection.rtl,),
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: text2),
                ),
              ]),

          /////////////

          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                // Text(
                //   textDirection: TextDirection.rtl,
                //   text1, style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 3,),
                // Text(textf,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        //نرخ کیلوContainer
                        child: Container(
                          width: 300,
                          color: Colors.amber[600],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                    color: color,
                                    onPressed: () {
                                      setState(() {
                                        if (isTextEditabl) {
                                          isTextEditabl = true;
                                          color = Colors.red;
                                        } else {
                                          isTickMarkVisible = false;
                                          color = Colors.white;
                                        }
                                        if (isTextEditabl) {
                                          isTickMarkVisible = true;
                                          isTextEditabl = false;
                                        } else {
                                          isTickMarkVisible = false;
                                          isTextEditabl = true;
                                        }
                                      });
                                    },
                                    icon: Expanded(
                                      child: Container(
                                          color: Colors.blue,
                                          child: Icon(Icons.check)),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Expanded(
                                  child: Card(
                                    color: Colors.white70,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      enabled: isTextEditabl,
                                      controller: nerkh,
                                      decoration: InputDecoration(
                                        // suffixIcon: IconButton(
                                        //     color: Colors.red,
                                        //     onPressed: clearText,
                                        //     icon: Icon(
                                        //       Icons.close,
                                        //       size: 20,
                                        //     )),
                                        hintText: Nnerkh,hintTextDirection: TextDirection.rtl,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Card(
                                  color: Colors.white70,
                                  child: TextField(

                                    keyboardType: TextInputType.number,
                                    controller: kilo,
                                    decoration: InputDecoration(
                                      // suffixIcon: IconButton(
                                      //     color: Colors.red,
                                      //     onPressed: _clearText,
                                      //     icon: Icon(
                                      //       Icons.close,
                                      //       size: 22,
                                      //     )),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      hintText: ttext, hintTextDirection: TextDirection.rtl,),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        //نام/نام پدر Container
                        child: Container(
                          width: 230,
                          color: Colors.amber[600],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Card(
                                  color: Colors.white70,
                                  child: TextField(
                                    controller: names,
                                    // enabled: isTextEditabl,      اگر فعال باشد با روشن کردن تیک نام هم مانند نرخ قابل تغیر نمیباشد

                                    decoration: InputDecoration(
                                      // suffixIcon: IconButton(
                                      //     color: Colors.red,
                                      //     onPressed: clearText1,
                                      //     icon: Icon(
                                      //       Icons.close,
                                      //       size: 22,
                                      //     )),
                                      hintText: name1,hintTextDirection: TextDirection.rtl,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Card(
                                  color: Colors.white70,
                                  child: TextField(
                                    controller: fname,
                                    decoration: InputDecoration(
                                        // suffixIcon: IconButton(
                                        //     color: Colors.red,
                                        //     onPressed: clearText2,
                                        //     icon: Icon(
                                        //       Icons.close,
                                        //       size: 22,
                                        //     )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                        hintText: " نام پدر",hintTextDirection: TextDirection.rtl,),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  //کل پول
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 200, 100, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          textDirection: TextDirection.rtl,
                          "  کل پول = $result1 ",
                          style: TextStyle(color: Colors.black87, fontSize: 33),
                        ),
                      )),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 200, 100, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                            textDirection: TextDirection.rtl,
                            "  مقدار عشر = $result2",
                            style: TextStyle(color: Colors.black87, fontSize: 33)),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  /////پول مشتری
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 200, 100, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Expanded(
                          child: Text(
                              textDirection: TextDirection.rtl,
                              "  پول مشتری = $result3",
                              style:
                              TextStyle(color: Colors.black87, fontSize: 33)),
                        ),
                      )),
                ),
                SizedBox(
                  height:10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.green[500],
                        shape: OutlineInputBorder(),
                        height: 70,
                        onPressed: () async{
                          /////////
                          final String name =names.text;
                          final String fatherName = fname.text;
                          final int integer = int.tryParse(kilo.text) ?? 0;
                          final int integer2 = int.tryParse(nerkh.text) ?? 0;

                          final DataModel newData = DataModel(name: name, fatherName: fatherName, integer: integer, integer2: integer2);

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          List<String> savedData = prefs.getStringList('data') ?? [];
                          savedData.add('${newData.name},${newData.fatherName},${newData.integer},${newData.integer2}');
                          await prefs.setStringList('data', savedData);
                          /////////

                          setState(() {

                            result1 = 0;
                            result2 = 0;
                            result3 = 0;
                            kilo.text = "";
                            names.text = "";
                            fname.text = "";
                          });
                        },
                        child: Text(
                          "ذخیره",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      MaterialButton(
                        onLongPress: (){
                          setState(() {

                            result1 = 0;
                            result2 = 0;
                            result3 = 0;
                            kilo.text = "";
                            names.text = "";
                            fname.text = "";
                          });
                        },
                        color: Colors.blue,
                        shape: OutlineInputBorder(),
                        height: 70,
                        onPressed: () {
                          setState(() {
                            num n1 = num.parse(nerkh.text);
                            num n2 = num.parse(kilo.text);

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
                          });
                        },
                        child: Text(
                          "محاسبه",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
