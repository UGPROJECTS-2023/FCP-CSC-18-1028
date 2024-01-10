import 'package:dietician/screen/admin/post-news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../component/constant.dart';
import '../../component/double_clik_close.dart';
import '../../main.dart';
import '../student/places.dart';
import '../student/news.dart';
import '../admin/profile.dart';
import 'addDepartment.dart';
import 'dashboard.dart';
import 'drug-list.dart';
import 'manage-student.dart';

class Admin_nav extends StatefulWidget {
  const Admin_nav({
    Key? key,
  }) : super(key: key);

  // final String title;

  @override
  State<Admin_nav> createState() => _Admin_navState();
}

class _Admin_navState extends State<Admin_nav> {
  int currentIndex = 0;
  final _pageController = PageController();
  List<Widget> _option = [
    DoubleClick(
      child: AdminDashboard(),
    ),
    DoubleClick(child: AddDepartment(false)),
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
                Icons.school,
              ),
              label: "Enroll course",
            ),
            BottomNavigationBarItem(
              backgroundColor: kWhiteSmoke,
              icon: Icon(
                Icons.map_outlined,
              ),
              label: "Indoor Nav",
            ),

            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            // Customer_Home(),
          ]),
    );
  }
}
