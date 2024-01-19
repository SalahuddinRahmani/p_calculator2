import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'mod/person.g.dart';
import 'splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class DisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],

      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        // backgroundColor: Color.fromRGBO(7, 57, 65, 1),

        title: Text('لیست خرید',style: TextStyle(color: Colors.white70,fontSize: 35),),
        centerTitle: true,
      ),
      body: FutureBuilder<Box<Person>>(
        future: Hive.openBox<Person>(HiveBoxes.personBox),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final Box<Person> personBox = snapshot.data!;
              return ValueListenableBuilder(
                valueListenable: personBox.listenable(),
                builder: (context, Box<Person> box, _) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final Person person = box.getAt(index)!;
                      return Container(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[

                            ],
                            gradient: LinearGradient(colors: [
                              Colors.amber,
                              Color.fromRGBO(251, 150, 26, 1.0),

                            ]),
                            border: Border.all(color: Colors.black87),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(



                          trailing: IconButton(
                              color: Colors.red,
                              icon: Icon(Icons.delete),
                              onPressed: () { Alert(
                                context: context,
                                type: AlertType.warning,
                                title: "! حذف شود",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "نخیر",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {personBox.deleteAt(index);Navigator.pop(context);  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.amber[900],

                                        content: Text(
                                          '👍حذف شد',style: TextStyle(fontSize: 20,color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),);} ,
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(2, 77, 99, 1.0)  ,
                                      Color.fromRGBO(8, 57, 11, 0.922),


                                    ]),
                                  )
                                ],
                              ).show();}
                          ),


                          title: Center(child: Text('${person.name} ولد ${person.fatherName}',style: TextStyle(color: Colors.black87,fontSize: 20),)),
                          subtitle: Text('نرخ =  ${person.age}                مقدار :${person.height}کیلو',style: TextStyle(color: Colors.black87,fontSize: 20),),
                        ),
                      );
                    },
                  );
                },
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

