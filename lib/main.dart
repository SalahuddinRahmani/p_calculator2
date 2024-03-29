import 'dart:io';
import 'person.g.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aboutPage.dart';
import 'package:p_calculator2/taiin maghz.dart';
import 'list.dart';

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

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 200, 100, 1),
              ),
              child: ListTile(
                onTap: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayPage()),
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
              decoration:
                  BoxDecoration(color: Color.fromRGBO(254, 220, 110, 1)),
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
                  style: TextStyle(fontSize: 25, color: Colors.black87),
                ),
              ),
            ),

            //AboutPage
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 200, 100, 1)),
              child: ListTile(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
                  "سازنده برنامه",
                  style: TextStyle(fontSize:25, color: Colors.black87),
                ),
              ),
            ),

            //بیرون شدن از برنامه
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(254, 220, 110, 1)),
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Color.fromRGBO(254, 220, 110, 1),
                          title: Text(
                            "میخواهید از برنامه بیرون شوید؟",
                            style: TextStyle(color: Colors.black87),
                          ),
                          actions: [
                            MaterialButton(
                              color: Colors.red,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "نخیر",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            MaterialButton(
                              color: Colors.green[800],
                              onPressed: () {
                                exit(0);
                              },
                              child: Text(
                                "بلی",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
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
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.w900, fontSize: 20),
        ),
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
                                          color = Colors.indigo;
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
                                          color: Colors.amber[900],
                                          child: Icon(Icons.check)),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Expanded(
                                  child: Card(
                                    color: Colors.white70,
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      keyboardType: TextInputType.number,
                                      enabled: isTextEditabl,
                                      controller: nerkh,
                                      decoration: InputDecoration(
                                        labelText: Nnerkh,
                                        hintTextDirection: TextDirection.rtl,
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

                                   textDirection: TextDirection.rtl,
                                    keyboardType: TextInputType.number,
                                    controller: kilo,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      labelText: ttext,
                                      hintTextDirection: TextDirection.rtl,
                                    ),
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
                          width: 300,
                          color: Colors.amber[600],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Card(
                                  color: Colors.white70,
                                  child: TextField(                                   textDirection: TextDirection.rtl,
                                    controller: names,
                                    // enabled: isTextEditabl,      اگر فعال باشد با روشن کردن تیک نام هم مانند نرخ قابل تغیر نمیباشد

                                    decoration: InputDecoration(
                                      labelText: name1,
                                      hintTextDirection: TextDirection.rtl,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                    textDirection: TextDirection.rtl,
                                    controller: fname,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      labelText: " نام پدر",
                                      hintTextDirection: TextDirection.rtl,
                                    ),
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
                          "  کل پول = ${result1.toInt()} ",
                          style: TextStyle(color: Colors.black87, fontSize: 25),
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
                            style:
                                TextStyle(color: Colors.black87, fontSize: 25)),
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
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 25)),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // MaterialButton(
                      //   color: Colors.green[500],
                      //   shape: OutlineInputBorder(),
                      //   height: 70,
                      //   onPressed: () {
                      //     /////////
                      //     final person = Person(
                      //       name: names.text,
                      //       fatherName: fname.text,
                      //       kilo: int.tryParse(nerkh.text) ?? 0,
                      //       meghdar: int.tryParse(kilo.text) ?? 0,
                      //     );
                      //     savePerson(person);
                      //     /////////
                      //
                      //     setState(() {
                      //       result1 = 0;
                      //       result2 = 0;
                      //       result3 = 0;
                      //       kilo.text = "";
                      //       names.text = "";
                      //       fname.text = "";
                      //     });
                      //   },
                      //   child: Text(
                      //     "ذخیره",
                      //     style: TextStyle(color: Colors.white, fontSize: 25),
                      //   ),
                      // ),

                      GestureDetector(
                        onTap: () {
                          /////////
                          final person = Person(
                            name: names.text,
                            fatherName: fname.text,
                            kilo: int.tryParse(nerkh.text) ?? 0,
                            meghdar: int.tryParse(kilo.text) ?? 0,
                          );
                          savePerson(person);
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
                        child: CircleAvatar(
                          backgroundColor: Colors.amber[800],
                          radius: 45,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber[600],
                            radius: 40,
                            child: Text(
                              "ذخیره",
                              style: TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                      ),


                      // MaterialButton(
                      //   onLongPress: () {
                      //     setState(() {
                      //       result1 = 0;
                      //       result2 = 0;
                      //       result3 = 0;
                      //       kilo.text = "";
                      //       names.text = "";
                      //       fname.text = "";
                      //     });
                      //   },
                      //   color: Colors.blue,
                      //   shape: OutlineInputBorder(),
                      //   height: 70,
                      //   onPressed: () {
                      //     setState(() {
                      //       num n1 = num.parse(nerkh.text);
                      //       num n2 = num.parse(kilo.text);
                      //
                      //       if (selectedValue == 2) {
                      //         result1 = (n1 / 8) * n2;
                      //       }
                      //
                      //       if (selectedValue == 1) {
                      //         result1 = (n1 / 4) * n2;
                      //       }
                      //
                      //       if (selectedValue == 3) {
                      //         result1 = n1 * n2;
                      //       }
                      //
                      //       result2 = result1 / a; //بول عشر
                      //
                      //       result3 = result1 - result2; //بول مشتری
                      //     });
                      //   },
                      //   child: Text(
                      //     "محاسبه",
                      //     style: TextStyle(color: Colors.white, fontSize: 25),
                      //   ),
                      // ),

                      SizedBox(width: 30,),

                      GestureDetector(

                        onLongPress: () {
                          setState(() {
                            result1 = 0;
                            result2 = 0;
                            result3 = 0;
                            kilo.text = "";
                            names.text = "";
                            fname.text = "";
                          });
                        } ,
                        onTap:  () {
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
                        child: CircleAvatar(
                          backgroundColor: Colors.amber[800],
                          radius: 45,
                          child: CircleAvatar(
                            backgroundColor: Colors.amber[600],
                            radius: 40,
                            child: Text(
                            "محاسبه",
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),),
                        ),
                      )
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
