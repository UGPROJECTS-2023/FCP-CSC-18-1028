import 'dart:convert';

import 'package:flutter/material.dart';
import '../../component/constant.dart';
import '../student/profile.dart';
import 'addGuidelines.dart';
import 'package:http/http.dart' as http;

class viewPerformance extends StatefulWidget {
  // final name, studentID;
  const viewPerformance();
  @override
  State<viewPerformance> createState() => _viewPerformanceState();
}

class _viewPerformanceState extends State<viewPerformance> {
  @override
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];
  List departmentData = [];
  Future<List> findInvoice() async {
    // SharedPreferences pred = await SharedPreferences.getInstance();
    try {
      var res = await http
          .post(Uri.parse(myurl), body: {"request": "FETCH ALL DEPARTMENT"});

      setState(() {
        departmentData = jsonDecode(res.body);
      });
    } catch (e) {
      print(e);
    }
    return departmentData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findInvoice();
  }

  final List<String> subtitles = [
    'Tracks grades, scores, and overall academic achievements.',
    'Monitors regular attendance and punctuality',
    'Classroom participation, and engagement in various school events',
    'Tracks performance in quizzes, tests, and exams',
    'Discipline, conduct, participation in class, and interactions ',
  ];

  final List<String> title = [
    'Academic Performance',
    'Attendance and Punctuality',
    'Participation and Engagement',
    'Assessments and Evaluations',
    'Behavioral Observations',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: kDefault)),
              ],
            ),
            elevation: 0.0,
            backgroundColor: kWhite),
        body: FutureBuilder(
            future: findInvoice(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              var myData = snapshot.data;
              if (myData == null) {
                return Scaffold(
                  body:
                      // children: [
                      ShowSkelaton(),
                );
              } else {
                return myData.isNotEmpty
                    ? SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "ADD REGISTRATION GUIDELINES "
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kDefault,
                                        fontFamily: "Bold"),
                                  ),
                                  Divider(),
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: departmentData.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddGuidelines(
                                                            name:
                                                                departmentData[
                                                                        index]
                                                                    ['name'],
                                                            departmentID:
                                                                departmentData[
                                                                        index][
                                                                    'department_id'])));
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                4.0), // Add padding around each container
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: colors[index %
                                                            colors.length]
                                                        .withOpacity(0.3),
                                                    offset: Offset(2, 2),
                                                    blurRadius: 2,
                                                    spreadRadius: 2,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: kWhiteSmoke,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        width: 10,
                                                        decoration: BoxDecoration(
                                                            color: colors[index %
                                                                colors.length],
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10))),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Center(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '${departmentData[index]['name']}',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontFamily:
                                                                      "Bold"),
                                                            ),
                                                            Text(
                                                                "${departmentData[index]['faculty']}")
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  departmentData[index]
                                                              ['status'] ==
                                                          '0'
                                                      ? Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 60,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: kRed),
                                                              child: Center(
                                                                child: Text(
                                                                  "Not set",
                                                                  style: TextStyle(
                                                                      color:
                                                                          kWhite),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 60,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color:
                                                                      kGreen),
                                                              child: Center(
                                                                child: Text(
                                                                  "Set",
                                                                  style: TextStyle(
                                                                      color:
                                                                          kWhite),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                ])),
                      )
                    : Text("No available Courses");
              }
            }));
  }
}
