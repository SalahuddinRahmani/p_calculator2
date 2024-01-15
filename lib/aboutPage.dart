import 'package:flutter/material.dart';

void main() {
  runApp(AboutPage());
}

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Salahuddin Rahmani",
                style: TextStyle(
                    fontSize: 30, fontFamily: "font1", color: Colors.white),
              ),
              SizedBox(
                height:10,
                width: 300,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/BeautyPlus_۲۰۲۳۰۷۱۵۲۰۱۶۵۰۰۵۲_save.jpg"),
                radius:80,
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                height: 70,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "Salahuddin Rahmani",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.baby_changing_station_outlined,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "1380/4/4",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.blue,
                    size: 44,
                  ),
                  title: Text(
                    "093794317864",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "Instagram account",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "salahuddinrahmani4040@gmail.com",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.telegram,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "tm.salahuddin4079",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 77,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                    size: 44,
                  ),
                  title: Text(
                    "tm.salahuddin4079",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
