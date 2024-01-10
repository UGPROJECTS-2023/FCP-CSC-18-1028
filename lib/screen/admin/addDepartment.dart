import 'dart:async';
import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../../component/button.dart';
import '../../component/constant.dart';
import '../../component/dropdown.dart';
import '../../component/inputs.dart';

class AddDepartment extends StatefulWidget {
  final status;
  AddDepartment(this.status);

  @override
  State<AddDepartment> createState() => _AddDepartmentState();
}

class _AddDepartmentState extends State<AddDepartment> {
  final _formKey = GlobalKey<FormState>();
  bool processing = false;

  bool isLoading = false;

  TextEditingController name = new TextEditingController();
  TextEditingController description = new TextEditingController();

  showAlertDialog(BuildContext context) {
    Widget okBtn = TextButton(
      onPressed: () {
        Navigator.of(context).pop('dialog');
        Navigator.of(context).pop('dialog');
        // Navigator.of(context)Lawal
        //     .push(MaterialPageRoute(builder: (context) => CleanerRecord()));
      },
      child: Text("Okay"),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Status"),
      content: Text("Registration Successfully"),
      actions: [
        okBtn,
      ],
    );

    //show the dialog alert
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _successRegister(context) {
    AnimatedSnackBar.rectangle(
      'Status ',
      'News was posted successfully!',
      type: AnimatedSnackBarType.success,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  void _errorRegister(context) {
    AnimatedSnackBar.rectangle(
      'Status ',
      'Department has already registered!',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  String? selectClass = "Program";

  List<String> selectClassItems = [
    "Program",
    "300 Years program",
    "400 Years program",
    "500 Years program",
    "600 Years program",
  ];
  String? selectFaculty = "Faculty";
  List<String> facultyItems = [
    'Faculty',
    'Faculty of Science',
    'Faculty of Mathematics',
    'Faculty of Art',
    'Faculty of Engineering',
    'Faculty of Arts and Humanities',
    'Faculty of Social Sciences',
    'Faculty of Natural Sciences',
    'Faculty of Education',
    'Faculty of Management Sciences',
    'Faculty of Medicine',
  ];

  registerUser() async {
    ToastContext().init(context);
    if (facultyItems == "faculty" || selectClass == "Program") {
      warningAlert(context, "Fields are required");
    } else {
      if (_formKey.currentState!.validate()) {
        var connectedResult = await Connectivity().checkConnectivity();
        if (connectedResult == ConnectivityResult.mobile ||
            connectedResult == ConnectivityResult.wifi) {
          setState(() {
            isLoading = true;
          });
          isLoading
              ? _showDialog()
              : Navigator.of(context, rootNavigator: true).pop('dialog');
          Timer(Duration(seconds: 3), () {});
          final res = await http.post(Uri.parse(myurl), body: {
            "request": "ADD DEPARTMENT",
            "name": name.text,
            "faculty": selectFaculty.toString(),
            "duration": selectClass.toString(),
            "description": description.text,
            // "user_id": "1",
          });

          if (jsonDecode(res.body) == "exits") {
            setState(() {
              isLoading = false;
            });
            !isLoading ? Navigator.of(context).pop('dialog') : _showDialog();

            _errorRegister(context);
          } else {
            if (jsonDecode(res.body) == "success") {
              setState(() {
                isLoading = false;
              });
              !isLoading ? Navigator.of(context).pop('dialog') : _showDialog();
              setState(() {
                isLoading = true;
              });

              successAlert(context, "Department Added successfully");
              Timer(Duration(seconds: 3), () {
                Navigator.of(context).pop();
              });

              name.clear();
              description.clear();
            } else {
              Toast.show("Error occured pls try again!",
                  duration: Toast.lengthShort, gravity: Toast.bottom);
            }
          }
        } else {
          _Connectivity();
        }
        setState(() {
          processing = false;
        });
      }
    }
  }

  void _Connectivity() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(Icons.cancel, size: 30.0, color: Colors.deepOrange[200]),
              SizedBox(
                width: 20.0,
              ),
              new Text("No internet connection!"),
            ],
          ),
        );
      },
    );
  }

  void _actionsDialog(icon, color, title) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(icon, size: 30.0, color: color),
              SizedBox(
                width: 20.0,
              ),
              new Text(title),
            ],
          ),
        );
      },
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Color.fromARGB(99, 31, 87, 59),
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(
                strokeWidth: 2.0,
                color: kWhite,
              ),
              SizedBox(
                width: 25.0,
              ),
              new Text(
                "Please wait...",
                style: TextStyle(color: kWhite),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 243, 226),
        appBar: AppBar(
          automaticallyImplyLeading: widget.status == 1 ? false : true,
          centerTitle: true,
          backgroundColor: kGreen,
          title: Text(
            "Add Department",
            style: TextStyle(
              fontSize: 15,
              color: kWhite,
            ),
          ),
        ),
        body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 10.0, right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kWhiteSmoke, width: 1.5)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Enroll new department",
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 1.5,
                                      fontFamily: "Bold")),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Inputs(
                                  obsecure: false,
                                  controller: name,
                                  hint: "Department name",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.school,
                                  )),
                              sizedBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Faculty",
                                      style: TextStyle(fontFamily: "Bold")),
                                  MyDropDown(
                                    items: facultyItems,
                                    onChange: (value) {
                                      setState(() {
                                        selectFaculty = value as String;
                                      });
                                    },
                                    selectedItem: selectFaculty,
                                  ),
                                ],
                              ),
                              sizedBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Duration",
                                      style: TextStyle(fontFamily: "Bold")),
                                  MyDropDown(
                                    items: selectClassItems,
                                    onChange: (value) {
                                      setState(() {
                                        selectClass = value as String;
                                      });
                                    },
                                    selectedItem: selectClass,
                                  ),
                                ],
                              ),
                              sizedBox,
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Description/Summary",
                                    style: TextStyle(fontFamily: "Bold"),
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: kGrey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: description,
                                    maxLines: 4, //or null
                                    decoration: InputDecoration.collapsed(
                                        hintText:
                                            "Enter your Description/Summary here..."),
                                  ),
                                ),
                              ),
                              sizedBox,
                              sizedBox,
                              DefaultButton(
                                  color: Color.fromARGB(255, 160, 97, 2),
                                  icon: Icons.login_outlined,
                                  title: "Add Department",
                                  onPressed: () => registerUser()),
                              sizedBox,
                              sizedBox,
                              sizedBox,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
