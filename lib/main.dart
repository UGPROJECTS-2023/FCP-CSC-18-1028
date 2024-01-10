import 'dart:async';
import 'dart:convert';
import 'package:dietician/component/splash.dart';
import 'package:dietician/screen/student/dashboard.dart';
import 'package:dietician/screen/student/news.dart';
import 'package:dietician/screen/student/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bottom_bar/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'component/constant.dart';
import 'component/double_clik_close.dart';
import 'component/user-appBar.dart';
import 'screen/student/places.dart';
import 'screen/student/login.dart';

var username;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pred = await SharedPreferences.getInstance();
  username = pred.getString('email');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Student Registration Guide',
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}

class Student_nav extends StatefulWidget {
  const Student_nav({
    Key? key,
  }) : super(key: key);

  // final String title;

  @override
  State<Student_nav> createState() => _Student_navState();
}

class _Student_navState extends State<Student_nav> {
  int currentIndex = 0;
  List<Widget> _option = [
    DoubleClick(
      child: Bot(),
    ),
    DoubleClick(
      child: News(),
    ),
    DoubleClick(
      child: Places(),
    ),
    DoubleClick(child: Profile()),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _option[currentIndex],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              this.currentIndex = index;
            });
          },
          elevation: 0.0,
          unselectedItemColor: kBlack,
          unselectedFontSize: 8.0,
          selectedFontSize: 8.0,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(height: 2.5),
          selectedItemColor: kDefault,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: kWhiteSmoke,
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: kWhiteSmoke,
              icon: Icon(
                Icons.message_outlined,
              ),
              label: "News",
            ),
            BottomNavigationBarItem(
              backgroundColor: kWhiteSmoke,
              icon: Icon(
                Icons.message_outlined,
              ),
              label: "Available Places",
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_outlined), label: "Account"),
            // Customer_Home(),
          ]),
    );
  }
}
