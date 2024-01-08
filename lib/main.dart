
import 'package:flutter/material.dart';
import 'aboutPage.dart' as secondPage;
import 'package:p_calculator2/setting.dart';
import 'package:p_calculator2/taiin maghz.dart';

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

  String name1="  نام";


//تغیر فیصدی بول
  num selectedValue2=1;
  num a=10;
  String textf="10 %";



  Color color = Colors.white;
  bool isTextEditabl = true;
  bool isTickMarkVisible = false;

  int value = 0;
  String text1 = "8 کیلو ";

  // //003 بخش تعیین ۴کیلو یا من یا ۸ کیلو

  String ttext="   کیلو";


  //// 002بخش باک کردن نرخ و کیلو
  void _clearText() {
    String currentText = tec2.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      tec2.text = updatedText;
    }
  }

  void clearText() {
    String currentText = tec1.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      tec1.text = updatedText;
    }
  }

  ////// 001 بخش باک کردن حروف نام و نام بدر
  var name = TextEditingController();
  var fname = TextEditingController();

  void clearText1() {
    String currentText = name.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      name.text = updatedText;
    }
  }

  void clearText2() {
    String currentText = fname.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      fname.text = updatedText;
    }
  }

  //001///
  num result4 = 0;
  num result3 = 0;
  num result2 = 0;
  num result1 = 0;

  int? selectedValue = 2;

  var tec1 = TextEditingController();
  var tec2 = TextEditingController();

  void dispose() {
    tec2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 53, 53, 0.1),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[800],
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.import_contacts_outlined,
                    size: 30,
                    color: Colors.white,
                  )),
              title: Text(
                textDirection: TextDirection.rtl,
                "لیست",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),        ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (dd){
                  return Maghz();
                }));
              },
              leading: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.white,
                  )),
              title: Text(
                textDirection: TextDirection.rtl,
                "تایین قیمت مغز",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (cc){
                  return Setting();
                }));
              },
              leading: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.white,
                  )),
              title: Text(
                textDirection: TextDirection.rtl,
                "تنظیمات برنامه",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (aa) {
                    return secondPage.MyApp();
                  }));
                });
              },
              leading: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.featured_play_list_rounded,
                    size: 30,
                    color: Colors.white,
                  )),
              title: Text(
                textDirection: TextDirection.rtl,
                "About Page",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            textDirection: TextDirection.rtl,
            "ماشین حساب P",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
        actions: [
          //PubRa

          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text(
                  textDirection: TextDirection.rtl,
                  text1, style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3,),
                Text(textf,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 17,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      color: Colors.blueGrey,
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
                                      color = Colors.white;
                                    } else {
                                      isTickMarkVisible = false;
                                      color = Colors.red;
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
                                icon: Container(
                                    color: Colors.blue,
                                    child: Icon(Icons.check))),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                enabled: isTextEditabl,
                                controller: tec1,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      color: Colors.red,
                                      onPressed: clearText,
                                      icon: Icon(
                                        Icons.close,
                                        size: 22,
                                      )),
                                  hintText: "   نرخ",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tec2,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        color: Colors.red,
                                        onPressed: _clearText,
                                        icon: Icon(
                                          Icons.close,
                                          size: 22,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: ttext),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 44,
                    ),
                    Container(
                      width: 230,
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white,
                              child: TextField(
                                controller: name,
                                // enabled: isTextEditabl,      اگر فعال باشد با روشن کردن تیک نام هم مانند نرخ قابل تغیر نمیباشد

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      color: Colors.red,
                                      onPressed: clearText1,
                                      icon: Icon(
                                        Icons.close,
                                        size: 22,
                                      )),
                                  hintText: name1,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white,
                              child: TextField(
                                controller: fname,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        color: Colors.red,
                                        onPressed: clearText2,
                                        icon: Icon(
                                          Icons.close,
                                          size: 22,
                                        )),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "    نام/پدر"),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    title: Text(
                      textDirection: TextDirection.rtl,
                      "  کل پول= $result1 ",
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                  )),
              SizedBox(height: 15),
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    title: Text(
                        textDirection: TextDirection.rtl,
                        "  مقدار عشر = $result2",
                        style: TextStyle(color: Colors.white, fontSize: 33)),
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(

                    title: Text(
                        textDirection: TextDirection.rtl,
                        "  پول مشتری = $result3",
                        style: TextStyle(color: Colors.white, fontSize: 33)),
                  )),
              SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.redAccent,
                    shape: OutlineInputBorder(),
                    height: 88,
                    onPressed: () {
                      setState(() {
                        result1 = 0;
                        result2 = 0;
                        result3 = 0;
                        tec2.text = "";
                        name.text="";
                        fname.text="";
                      });
                    },
                    child: Text(
                      "انجام شد",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    shape: OutlineInputBorder(),
                    height: 88,
                    onPressed: () {
                      setState(() {
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
                      });
                    },
                    child: Text(
                      "حساب",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
