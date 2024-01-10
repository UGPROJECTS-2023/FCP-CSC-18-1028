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

class AddGuidelines extends StatefulWidget {
  final name, departmentID;
  AddGuidelines({this.name, this.departmentID});

  @override
  State<AddGuidelines> createState() => _AddGuidelinesState();
}

class _AddGuidelinesState extends State<AddGuidelines> {
  final _formKey = GlobalKey<FormState>();
  bool processing = false;

  bool isLoading = false;

  TextEditingController step1 = new TextEditingController();
  TextEditingController step2 = new TextEditingController();
  TextEditingController step3 = new TextEditingController();
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
      'News is already Posted!',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  String? selectSession = "Session";
  String? selectClass = "Select";

  List<String> selectClassItems = [
    "Select",
    "New student",
    "Returning student",
  ];

  List<String> ageItems = [
    'Session',
    '2022 / 2023',
    '2023 / 2024',
    '2024 / 2025',
    '2025 / 2026',
    '2026 / 2027',
  ];

  registerUser() async {
    ToastContext().init(context);

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
          "request": "ADD GUIDELINES",
          "to": selectClass.toString(),
          "session": selectSession.toString(),
          "course_id": widget.departmentID.toString(),
          "step1": step1.text,
          "step2": step3.text,
          "step3": step3.text,
          "others": description.text,
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

            successAlert(context, "Guidelines posted successfully");
            Timer(Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });

            step1.clear();
            step2.clear();
            step3.clear();
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
          // automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kGreen,
          title: Text(
            "${widget.name} Department",
            style: TextStyle(fontSize: 15),
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
                              Text(
                                  "Registration Guidelines for ${widget.name} department",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: "Bold")),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To:", style: TextStyle(fontFamily: "Bold")),
                              MyDropDown(
                                items: selectClassItems,
                                onChange: (value) {
                                  setState(() {
                                    selectClass = value as String;
                                  });
                                },
                                selectedItem: selectClass,
                              ),
                              sizedBox,
                              Text("Semester/Session",
                                  style: TextStyle(fontFamily: "Bold")),
                              MyDropDown(
                                items: ageItems,
                                onChange: (value) {
                                  setState(() {
                                    selectSession = value as String;
                                  });
                                },
                                selectedItem: selectSession,
                              ),
                              sizedBox,
                              Inputs(
                                  obsecure: false,
                                  controller: step1,
                                  hint: "Step 1",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.school,
                                  )),
                              sizedBox,
                              Inputs(
                                  obsecure: false,
                                  controller: step2,
                                  hint: "Step 2",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.school,
                                  )),
                              sizedBox,
                              Inputs(
                                  obsecure: false,
                                  controller: step3,
                                  hint: "Step 3",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.school,
                                  )),
                              sizedBox,
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Other Steps",
                                    style: TextStyle(fontFamily: "Bold"),
                                  )),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: description,
                                    maxLines: 4, //or null
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Enter other steps here..."),
                                  ),
                                ),
                              ),
                              sizedBox,
                              sizedBox,
                              DefaultButton(
                                  color: Color.fromARGB(255, 160, 97, 2),
                                  icon: Icons.save,
                                  title: "Add guidelines",
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
