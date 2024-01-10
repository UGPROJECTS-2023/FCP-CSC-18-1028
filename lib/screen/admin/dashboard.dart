import 'dart:convert';
import 'package:dietician/menu.dart';
import 'package:dietician/screen/admin/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../component/appBar.dart';
import '../../component/constant.dart';
import '../../component/customerContainer.dart';
import '../../component/smallContainer.dart';
import '../student/places.dart';
import '../student/login.dart';
import 'add-location.dart';
import 'addCourses.dart';
import 'addDepartment.dart';
import 'drug-list.dart';
import 'manage-student.dart';
import 'post-news.dart';
import 'viewCourses.dart';

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  //show the dialog alert

  showAlertDialog(
      // BuildContext context,
      ) {
    Widget okBtn = TextButton(
      onPressed: () {
        Navigator.of(context).pop('dialog');
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Menu()));
      },
      child: Text("Yes"),
    );

    Widget noBtn = TextButton(
      onPressed: () {
        Navigator.of(context).pop('dialog');
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => CleanerRecord()));
      },
      child: Text("No"),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Status"),
      content: Text("Confirm if you want to exist?"),
      actions: [
        okBtn,
        noBtn,
      ],
    );
  }

  String? name;
  profile() async {
    SharedPreferences pred = await SharedPreferences.getInstance();
    setState(() {
      name = pred.getString("name");
    });
  }

  Future<List> getUserData() async {
    // SharedPreferences pred = await SharedPreferences.getInstance();
    try {
      var res = await http
          .post(Uri.parse(myurl), body: {"request": "FETCH ALL CUSTOMER"});

      setState(() {
        customerData = jsonDecode(res.body);
      });
    } catch (e) {
      print(e);
    }
    return customerData;
  }

  var now, formattedDate;
  // dateUpdate() {
  //   now = new DateTime.now();
  //   var formatter = DateFormat.yMMMMd('en_US');
  //   formattedDate = formatter.format(now);
  // }

  List customerData = [];
  List countDrugs = [];
  List countTransaction = [];

  Future<List> countDrug() async {
    final res = await http.post(Uri.parse(myurl), body: {
      "request": "COUNT ALL DRUGS",
    });
    var convertToData = jsonDecode(res.body);
    setState(() {
      countDrugs = convertToData;
    });
    return countDrugs;
  }

  Future<List> countTran() async {
    final res = await http.post(Uri.parse(myurl), body: {
      "request": "COUNT ALL TRANSACTION",
    });
    var convertToData = jsonDecode(res.body);
    setState(() {
      countTransaction = convertToData;
    });
    return countTransaction;
  }

  @override
  void initState() {
    super.initState();
    profile();
    // dateUpdate();
    getUserData();
    countDrug();
    countTran();
    // daysBetween(date1, date2), 1;
    final d1 = DateTime.now();
    final d2 = d1.add(Duration(days: 2));

    // DateTime dt1 = DateTime.parse("2021-12-23 11:47:00");
    // DateTime dt2 = DateTime.parse("2018-09-12 10:57:00");

    // Duration diff = dt1.difference(dt2);

    // print(diff.inDays);
//output (in days): 1198

    // print(diff.inHours);
  }

  Logout() {}

  List<_SalesData> data = [
    _SalesData('Jan', 11),
    _SalesData('Feb', 28),
    _SalesData('Mar', 4),
    _SalesData('Apr', 0),
  ];

  // Duration diff;

  @override
  Widget build(BuildContext context) {
    // print('$differenceInDays');
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 243, 226),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // centerTitle: true,
          backgroundColor: kGreen,
          title: Row(
            children: [
              Image.asset(
                "assets/images/fud_logo.png",
                width: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("STUDENT REGISTRATION GUIDELINES",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: kWhite,
                          fontFamily: "RobotoBold")),
                  Text("Administrator",
                      style: TextStyle(
                        fontSize: 15,
                        color: kWhite,
                      ))
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Column(children: [
                        Container(
                          color: kWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                sizedBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ADMIN DASHBOARD",
                                      style: TextStyle(
                                          color: kGreen,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Khalid (Admin)",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Image.asset("assets/images/fud_gate.jpg"),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  // height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      "Federal University Dutse, Jigawa state in Nigeria has a relatively brief but impactful history. Established in 2004, FUD was founded as part of the efforts to expand access to higher education in Jigawa State.",
                                      style: TextStyle(
                                          color: kGreen,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  color: Color.fromRGBO(193, 247, 216, 0.6),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddDepartment(false))),
                                    txt: "Add Department",
                                    icon: Icons.school),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                viewPerformance())),
                                    txt: "Assign registration guide",
                                    icon: Icons.school),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PostLocation())),
                                    txt: "Add Indoor navigation",
                                    icon: Icons.map_outlined),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PostNews(false))),
                                    txt: "Post registration news ",
                                    icon: Icons.newspaper_outlined),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageStock())),
                                    txt: "Student record ",
                                    icon: Icons.newspaper_outlined),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Places())),
                                    txt: "Manage location ",
                                    icon: Icons.newspaper_outlined),
                                sizedBox,
                                SmallContainer(
                                    onTap: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => Login())),
                                    txt: "Logout ",
                                    icon: Icons.newspaper_outlined),
                                sizedBox,
                                sizedBox,
                                sizedBox,
                              ],
                            ),
                          ),
                        ),
                        sizedBox,
                        Container(
                          color: kWhite,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBox,
                                Container(
                                  // height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  color: kWhite,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Administrator's Dashboard",
                                            style: TextStyle(
                                                color: kGreen,
                                                fontWeight: FontWeight.w800),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ]),
                    ])))));
  }
}
