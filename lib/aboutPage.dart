import 'package:flutter/material.dart';
// final Uri _url = Uri.parse('@slahuddin4079');


Color color=Color.fromRGBO(10, 45, 33, 1.0);
Color color1=Colors.white;

enum Gender{
  sColor,
  mColor,
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var text = "SA ::^:: RA";
  var name="Salahuddin ";
  var birth="Birthday :  1380/7/12";
  var phone="093794317864";
  var lastName=" Rahmani";
  var telegram="@salahuddin4079";
  var edgucation="Flutter Developer";
  // Gender? selectedGender;

  Gender selectedGender =Gender.sColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 34, 42, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(22, 34, 42, 1),

        title: Container(
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.white70,offset: Offset(2,2),blurRadius: 99)
          ]),
          child: Text(
            "About Page",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration:BoxDecoration(shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.white70,offset: Offset(2, 2),blurRadius: 15)
                      ]),
                  child: CircleAvatar(
                    backgroundColor: selectedGender==Gender.sColor ? color1:color,
                    radius: 75,
                    child: CircleAvatar(backgroundImage: AssetImage("images/BeautyPlus_۲۰۲۳۰۷۱۵۲۰۱۶۵۰۰۵۲_save.jpg"),
                      radius: 70,

                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height:20,),
            Text(text,style: TextStyle(fontFamily: 'font1',
                fontSize: 15,  color: Colors.white,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,child: Divider(color: Colors.white,),width: 300,),
            SizedBox(height: 10,child: Divider(color: Colors.white,),width: 200,),
            SizedBox(height: 10,child: Divider(color: Colors.white,),width: 100,),
            SizedBox(height: 10,child: Divider(color: Colors.white,),width: 50,),
            // SizedBox(height: 10,child: Divider(color: Colors.white,),width: 25,),

            SizedBox(height: 33,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                         border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height:50,
                    child: ListTile(
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        name,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                         border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 50,
                    child: ListTile(
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.account_box_outlined,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        lastName ,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(

                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                         border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 50,
                    child: ListTile(
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.engineering,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        edgucation,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                         border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 50,
                    child: ListTile(

                      // onTap:_launchUrl,
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.telegram,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        telegram,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                      border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 50,
                    child: ListTile(
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        phone,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(22, 34, 42, 1),
                          Color.fromRGBO(10, 80, 88, 1.0),

                        ]),                         border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 50,
                    child: ListTile(
                      tileColor: Color.fromRGBO(10, 80, 53, 1.0),
                      leading: Icon(
                        Icons.badge_outlined,
                        color: Colors.white,
                        size: 44,
                      ),
                      title: Text(
                        birth,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),



                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
}
