import 'package:flutter/material.dart';

class Maghz extends StatefulWidget {
  const Maghz({super.key});

  @override
  State<Maghz> createState() => _MaghzState();
}

class _MaghzState extends State<Maghz> {
  Color color = Colors.white;
  bool isTextEditabl = true;
  bool isTickMarkVisible = false;

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

  num result1 = 0;
  var tec1 = TextEditingController();
  var tec2 = TextEditingController();

  void dispose() {
    tec2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      // backgroundColor: Color.fromRGBO(7, 57, 65, 1),

      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        // backgroundColor: Colors.white10,

        centerTitle: true,
        title: Text(
          "تعین نرخ مغز فی من 8 کیلو",
          style: TextStyle(
              color: Colors.white70, fontWeight: FontWeight.w900, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Flexible(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(color: Colors.amber[400]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white70,
                                child: Expanded(
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    keyboardType: TextInputType.number,
                                    enabled: isTextEditabl,
                                    controller: tec1,
                                    decoration: InputDecoration(
                                      hintText: "نرخ یک من پسته",
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
                              padding: EdgeInsets.all(8.0),
                              child: Card(
                                color: Colors.white70,
                                child: Expanded(
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    keyboardType: TextInputType.number,
                                    controller: tec2,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      hintText: "مقدار سیر",
                                      hintTextDirection: TextDirection.rtl,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 44,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 200, 100, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          textDirection: TextDirection.rtl,
                          " نرخ یک من مغز 4 کیلو =   ${result1.toStringAsFixed(1)} ",
                          style: TextStyle(color: Colors.black87, fontSize: 25),
                        ),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.green[500],
                        shape: OutlineInputBorder(),
                        height: 70,
                        onPressed: () {
                          setState(() {
                            result1 = 0;
                            tec2.text = "";
                            tec1.text = "";
                          });
                        },
                        child: Text(
                          "پاک",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        shape: OutlineInputBorder(),
                        height: 70,
                        onPressed: () {
                          setState(() {
                            num n1 = num.parse(tec1.text);
                            num n2 = num.parse(tec2.text);
                            result1 = (n1 / n2) * 40;
                          });
                        },
                        child: Text(
                          "انجام",
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
