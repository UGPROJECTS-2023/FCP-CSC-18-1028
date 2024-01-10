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

class CourseRegistration extends StatefulWidget {
  final status;
  CourseRegistration(this.status);

  @override
  State<CourseRegistration> createState() => _CourseRegistrationState();
}

class _CourseRegistrationState extends State<CourseRegistration> {
  final _formKey = GlobalKey<FormState>();
  bool processing = false;

  bool isLoading = false;

  TextEditingController title = new TextEditingController();
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

  String? selectGender = "Faculty";
  String? selectClass = "Program";

  List<String> selectClassItems = [
    "Program",
    "300 Years program",
    "400 Years program",
    "500 Years program",
    "600 Years program",
  ];

  List<String> ageItems = [
    'Faculty',
    'Faculty of Science',
    'Faculty of Mathematics',
    'Faculty of Art',
    'Faculty of Engineering',
    'Faculty of Mathematics',
    'Faculty of Mathematics',
    'Faculty of Arts and Humanities',
    'Faculty of Social Sciences',
    'Faculty of Natural Sciences',
    'Faculty of Education',
    'Faculty of Management Sciences',
    'Faculty of Medicine',
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
          "request": "POST NEWS",
          "title": title.text,
          "description": description.text,
          "user_id": "1",
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

            _successRegister(context);
            Timer(Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });

            title.clear();
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
          automaticallyImplyLeading: widget.status == 1 ? false : true,
          centerTitle: true,
          backgroundColor: kGreen,
          title: Text(
            "Post news",
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
                              const Text("Enroll new course",
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
                                  controller: title,
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
                              Inputs(
                                  obsecure: false,
                                  controller: title,
                                  hint: "Course Title",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.person_add_alt_1_outlined,
                                  )),
                              sizedBox,
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Semester / Session",
                                              style: TextStyle(
                                                  fontFamily: "Bold")),
                                          MyDropDown(
                                            items: ageItems,
                                            onChange: (value) {
                                              setState(() {
                                                selectGender = value as String;
                                              });
                                            },
                                            selectedItem: selectGender,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Credit unit",
                                            style:
                                                TextStyle(fontFamily: "Bold")),
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
                                  ),
                                ],
                              ),
                              sizedBox,
                              sizedBox,
                              Inputs(
                                  obsecure: false,
                                  controller: title,
                                  hint: "Semester/Session",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Semester is required";
                                    }
                                  },
                                  icon: Icon(
                                    Icons.person_add_alt_1_outlined,
                                  )),
                              sizedBox,
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "News Description",
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
                                            "Enter your news description here..."),
                                  ),
                                ),
                              ),
                              sizedBox,
                              sizedBox,
                              DefaultButton(
                                  color: Color.fromARGB(255, 160, 97, 2),
                                  icon: Icons.login_outlined,
                                  title: "Register now",
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
