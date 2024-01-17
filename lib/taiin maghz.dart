
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Maghz(),
  ));
}

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
      backgroundColor: Color.fromRGBO(7, 57, 65, 1),

      appBar: AppBar(
        backgroundColor: Colors.white10,

        centerTitle: true,
        title: Text("تعین نرخ مغز فی من 8 کیلو",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),

      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [


              Flexible(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:250,
                      height: 250,
                      color: Colors.blueGrey,
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.white70,
                              child: Expanded(
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
                                    hintText:

                                    "نرخ یک من پسته",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
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
                                      hintText: "مقدار سیر"),
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
                flex:3,
                child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      title: Text(
                        textDirection: TextDirection.rtl,
                        " نرخ یک من مغز 4 کیلو =   $result1 ",
                        style: TextStyle(color: Colors.white, fontSize: 33),
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
                      color: Colors.redAccent,
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
                          result1 = (n1 / n2) *40;
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
    );
  }
}
