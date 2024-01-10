import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import '../../component/constant.dart';
import '../student/profile.dart';

class ManageStock extends StatefulWidget {
  const ManageStock({super.key});

  @override
  State<ManageStock> createState() => _ManageStockState();
}

List findDrug = [];
bool isLoading = false;

class _ManageStockState extends State<ManageStock> {
  Future<List> findInvoice() async {
    // SharedPreferences pred = await SharedPreferences.getInstance();
    try {
      var res = await http
          .post(Uri.parse(myurl), body: {"request": "FETCH ALL STUDENT"});

      setState(() {
        findDrug = jsonDecode(res.body);
      });
    } catch (e) {
      print(e);
    }
    return findDrug;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findInvoice();
  }

  Future<void> delete(String id) async {
    ToastContext().init(context);

    setState(() {
      isLoading = true;
    });
    !isLoading ? Navigator.of(context).pop() : _showDialog();
    try {
      final res = await http
          .post(Uri.parse(myurl), body: {"request": "DELETE DRUGS", "id": id});
      setState(() {
        isLoading = false;
      });
      !isLoading ? Navigator.of(context).pop() : _showDialog();

      showAlertSuccess();

      findInvoice();
    } catch (e) {
      print(e);
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
              SizedBox(
                width: 25.0,
              ),
              Text("Please wait..."),
            ],
          ),
        );
      },
    );
  }

  showAlertSuccess() {
    // SweetAlert.show(
    //   context,
    //   style: SweetAlertStyle.success,
    //   title: "Action accomplished!",
    // );
  }

  showAlertDialog(id) {
    // SweetAlert.show(context,
    //     style: SweetAlertStyle.confirm,
    //     showCancelButton: true,
    //     subtitle: "You're about to delete this record.", onPress: (bool isYes) {
    //   if (isYes) {
    //     delete(id);
    //   } else {
    //     Navigator.of(context).pop();
    //   }

    //   return false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // var f = NumberFormat("###,###", "en_US");

    // print();
    String result = "";

    int totalAmount = 0;
    // for (int i = 0; i < findDrug.length; i++) {
    //   // setState(() {
    //   totalAmount += int.parse(findDrug[i]['total']);
    //   // });
    //   result = f.format(int.parse(totalAmount.toString()));
    // }

    // var formatter = new DateFormat('yyyy-MM-dd');
    var now = new DateTime.now();
    // var formatter = new DateFormat('yyyy-MM-dd');
    // String formattedDate = formatter.format(now);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 243, 226),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kGreen,
          title: Text("Manage student", style: TextStyle(fontSize: 15)),
        ),
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
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                sizedBox,
                                Container(
                                  color: kWhite,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: kWhite,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 40,
                                                  color: Color.fromRGBO(
                                                      149, 250, 193, 0.6),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 60,
                                                          child: Text("Name",
                                                              style: TextStyle(
                                                                  color: kGreen,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        Text("Email",
                                                            style: TextStyle(
                                                                color: kGreen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text("Username",
                                                            style: TextStyle(
                                                                color: kGreen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text("Action",
                                                            style: TextStyle(
                                                                color: kGreen,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text("")
                                                      ],
                                                    ),
                                                  )),
                                              ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: findDrug.length,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      color: Color.fromARGB(
                                                          255, 247, 252, 255),
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0,
                                                                  top: 5,
                                                                  bottom: 2),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    width: 75,
                                                                    child: Text(
                                                                        "${findDrug[index]['name']}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                kGreen,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                  ),
                                                                  Container(
                                                                    height: 35,
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  Container(
                                                                    width: 45,
                                                                    child: Text(
                                                                        "${findDrug[index]['email']}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                kGreen,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                  ),
                                                                  Container(
                                                                    height: 35,
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  Container(
                                                                      width: 50,
                                                                      child: Text(
                                                                          "${findDrug[index]['reg_no']}")),
                                                                  Container(
                                                                    height: 35,
                                                                    width: 0.5,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            30,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.deepOrange,
                                                                            borderRadius: BorderRadius.circular(5.0)),
                                                                        child: TextButton(
                                                                            onPressed: () {
                                                                              showAlertDialog(findDrug[index]['drug_id']);
                                                                            },
                                                                            child: Text(
                                                                              'Delete',
                                                                              style: TextStyle(fontSize: 12, color: kWhite),
                                                                            )),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                color:
                                                                    Colors.grey,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 0.5,
                                                              ),
                                                            ],
                                                          )),
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                      sizedBox,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text("No stock records"),
                      );
              }
            }));
  }
}
