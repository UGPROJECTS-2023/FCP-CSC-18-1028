import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../../component/constant.dart';
import '../../component/customerContainer.dart';
import '../student/profile.dart';

class DrugList extends StatefulWidget {
  DrugList({Key? key}) : super(key: key);

  @override
  State<DrugList> createState() => _DrugListState();
}

class _DrugListState extends State<DrugList> {
  List customerData = [];
  var id;
  int _counter = 1;
  bool isLoading = false;

  Future<void> delete(String user_id) async {
    ToastContext().init(context);

    setState(() {
      isLoading = true;
    });
    try {
      final res = await http.post(Uri.parse(myurl),
          body: {"request": "DELETE CUSTOMER", "id": user_id});
      setState(() {
        isLoading = false;
      });
      !isLoading ? print("object") : _showDialog();

      showAlertSuccess();

      getUserData();
    } catch (e) {
      print(e);
    }
  }

  Future<void> reject(String user_id) async {
    ToastContext().init(context);

    setState(() {
      isLoading = true;
    });
    try {
      final res = await http.post(Uri.parse(myurl),
          body: {"request": "REJECT CUSTOMER", "id": user_id});
      setState(() {
        isLoading = false;
      });
      !isLoading ? print("object") : _showDialog();

      showAlertSuccess();

      getUserData();
    } catch (e) {
      print(e);
    }
  }

  showAlertDialog(BuildContext context, Function pressed) {
    // SweetAlert.show(context,
    //     style: SweetAlertStyle.confirm,
    //     showCancelButton: true,
    //     subtitle: "You're about to delete this driver.", onPress: (bool isYes) {
    //   if (isYes) {
    //     pressed();
    //   } else {
    //     Navigator.of(context).pop();
    //   }

    //   return false;
    // });
  }

  showReject(BuildContext context, Function pressed) {
    // SweetAlert.show(context,
    //     style: SweetAlertStyle.error,
    //     showCancelButton: true,
    //     cancelButtonColor: Colors.amberAccent,
    //     confirmButtonColor: kRed,
    //     cancelButtonText: "No",
    //     confirmButtonText: "Proceed",
    //     subtitle: "You're about to reject this customer?.",
    //     onPress: (bool isYes) {
    //   if (isYes) {
    //     pressed();
    //   } else {
    //     Navigator.of(context).pop();
    //   }

    //   return false;
    // });
  }

  showAlertSuccess() {
    // SweetAlert.show(
    //   context,
    //   style: SweetAlertStyle.success,
    //   title: "Action accomplished!",
    // );
  }

  Future<List> getUserData() async {
    // SharedPreferences pred = await SharedPreferences.getInstance();
    try {
      var res = await http
          .post(Uri.parse(myurl), body: {"request": "FETCH ALL DRUG"});

      setState(() {
        customerData = jsonDecode(res.body);
      });
    } catch (e) {
      print(e);
    }
    return customerData;
  }

  void initState() {
    getUserData();
    profile();
    // print(patientData);
    super.initState();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
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

  String? name;
  profile() async {
    SharedPreferences pred = await SharedPreferences.getInstance();
    setState(() {
      name = pred.getString("name");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 243, 226),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kGreen,
        title: Text("Our stock record", style: TextStyle(fontSize: 15)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: FutureBuilder(
            future: getUserData(),
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
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: kWhite,
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    color: Color.fromRGBO(149, 250, 193, 0.6),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Drug record",
                                          style: TextStyle(
                                              color: kGreen,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                ListView.builder(
                                    // scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: customerData.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4.0, right: 4.0, top: 4.0),
                                        child: CustomerContainer(
                                          icon: () {
                                            showAlertDialog(context, () {
                                              delete(customerData[index]
                                                  ['drug_id']);
                                            });
                                          },
                                          reject: () {
                                            showReject(context, () {
                                              reject(customerData[index]
                                                  ['drug_id']);
                                            });
                                          },
                                          status: int.parse(customerData[index]
                                                      ['qty1']) >
                                                  0
                                              ? "Available"
                                              : "Out of stock",
                                          username:
                                              "${customerData[index]['drugname']}",
                                          dates:
                                              "${customerData[index]['price']}",
                                          price:
                                              "${customerData[index]['qty']}",
                                          counter: index + 1,
                                          date:
                                              "${customerData[index]['dates']}",
                                          onPressed: () {
                                            // showAlertDialog(context);
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         Payment(transactionData[index]['id'])));
                                          },
                                          title: customerData[index]['drugname']
                                              .toUpperCase(),
                                          qty: customerData[index]['qty1'],
                                          mfd: customerData[index]['mfd'],
                                          expire: customerData[index]
                                              ['expiring'],
                                          subtitle: customerData[index]
                                              ['phone'],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(child: Text("No Payment records"));
              }
            }),
      ),
    );
  }
}
