import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'person.g.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<Person> personList = [];
  int selectedTileIndex = -1;

  @override
  void initState() {
    super.initState();
    loadPersonList();
  }

  void loadPersonList() async {
    final Box<Person> personBox = await Hive.openBox<Person>(HiveBoxes.personBox);
    setState(() {
      personList = personBox.values.toList();
    });
  }

  int calculateSum() {
    int sum = 0;
    for (final person in personList) {
      sum += person.meghdar;
    }
    return sum;
  }

  num calculateMultiplication() {
    num multiplication = 0;
    for (final person in personList) {
      multiplication +=(person.kilo * person.meghdar/8);
    }
    return multiplication;
  }

  num calculateSubtraction() {
   num  subtraction = 0;
    for (final person in personList) {
      subtraction += (person.kilo * person.meghdar/8)/10;
    }
    return subtraction;
  }

  void performCalculations() {
    final sum = calculateSum();
    final multiplication = calculateMultiplication();
    final subtraction = calculateSubtraction();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.amber[50],
        // content: Text(
        //   'مجموع: $sum     کیلو ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
        //   textAlign: TextAlign.center,
        // ),
        content: Text(
          'کیلو: $sum    پول: $multiplication    مقدار عشر: $subtraction',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
          textAlign: TextAlign.center,
        ),

        duration: Duration(seconds: 5),
      ),
    );
  }

  void deletePerson(int index) async {
    final Box<Person> personBox = await Hive.openBox<Person>(HiveBoxes.personBox);
    personBox.deleteAt(index);
    setState(() {
      personList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        // backgroundColor: Color.fromRGBO(7, 57, 65, 1),

        title: Text(
          'لیست خرید',
          style: TextStyle(color: Colors.white70, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: personList.length,
        itemBuilder: (context, index) {
          final person = personList[index];
          return Container(
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[],
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(255, 200, 100, 1),
                  Color.fromRGBO(235, 160, 26, 1.0),


                ]),
                // color: Colors.amber[50],
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              title:


              Center(
                  child: Text(
                    '     ${person.name}  ولد  ${person.fatherName}',
                    style:
                    TextStyle(color: Colors.black87, fontSize: 20),
                  )),
              subtitle: Text( textDirection: TextDirection.rtl,
                ' کل پول: ${(person.kilo) * (person.meghdar/8)}    نرخ =  ${person.kilo}    مقدار: ${person.meghdar}  کیلو\nمقدار عشر : ${(person.kilo * person.meghdar/8)/10}  \nپول مشتری: ${(person.kilo * person.meghdar/8)-((person.kilo * person.meghdar/8)/10)}'
                ,style: TextStyle(fontSize: 13,color: Colors.black),
              ),

              leading: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "! حذف شود",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "نخیر",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(62, 14, 14, 0.922),
                              Color.fromRGBO(190, 9, 9, 0.936),
                            ]),
                          ),
                          DialogButton(
                            child: Text(
                              "بلی",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              deletePerson(index);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black87,
                                  content: Text(
                                    '👍حذف شد',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(2, 77, 99, 1.0),
                              Color.fromRGBO(8, 57, 11, 0.922),
                            ]),
                          )
                        ],
                      ).show();
                    }),
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber[800])),
        onPressed: performCalculations,
        child: Text('مجموع',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      ),
    );
  }
}