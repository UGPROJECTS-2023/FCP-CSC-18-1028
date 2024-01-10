import 'dart:async';
import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../../component/constant.dart';
import '../../component/dropdown.dart';
import '../../component/inputs.dart';

class PostNews extends StatefulWidget {
  final status;
  PostNews(this.status);

  @override
  State<PostNews> createState() => _PostNewsState();
}

class _PostNewsState extends State<PostNews> {
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

  String? selectType = "Select";

  List<String> typeItems = [
    "Select",
    "New student",
    "Returning student",
    "All student"
  ];
  registerUser() async {
    ToastContext().init(context);

    if (_formKey.currentState!.validate()) {
      if (selectType == "Select") {
        warningAlert(context, "Field is required");
      } else {
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
            "type": selectType.toString(),
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
                  const EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kWhiteSmoke, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Post news",
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2.0,
                                    fontFamily: "Bold",
                                  )),
                              Divider(),
                              const Text(
                                "News is information that is published in newspapers and broadcast on radio and television about recent events",
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To:", style: TextStyle(fontFamily: "Bold")),
                              MyDropDown(
                                items: typeItems,
                                onChange: (value) {
                                  setState(() {
                                    selectType = value as String;
                                  });
                                },
                                selectedItem: selectType,
                              ),
                              sizedBox,
                              Inputs(
                                  obsecure: false,
                                  controller: title,
                                  hint: "Title",
                                  validator: (value) {
                                    if (value == "") {
                                      return "Title is required";
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
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5.0),
                                  // border: Border.all(color: kGrey)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: description,
                                    maxLines: 8, //or null
                                    decoration: InputDecoration.collapsed(
                                        hintText:
                                            "Enter your news description here..."),
                                  ),
                                ),
                              ),
                              sizedBox,
                              sizedBox,
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 160, 97, 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide.none),
                                  onPressed: () {
                                    registerUser();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.newspaper_outlined,
                                        color: kWhite,
                                        size: 17,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Post news",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontFamily: "MyFont",
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
            ))));
  }
}
