import 'dart:async';
import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../../component/button.dart';
import '../../component/constant.dart';
import '../../component/inputs.dart';
import '../../main.dart';
import '../student/register.dart';
import 'nav.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  bool value = false;

  bool _processing = false;
  bool isLoading = false;

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _isPanelVisible = false;
  bool ActiveConnection = false;
  String T = "";

  login() async {
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
          "request": "ADMIN LOGIN",
          "username": username.text,
          "password": password.text,
        });

        List data = jsonDecode(res.body);
        if (data.isEmpty) {
          setState(() {
            isLoading = false;
          });
          !isLoading
              ? Navigator.of(context, rootNavigator: true).pop('dialog')
              : _showDialog();
          _errorRegister(context);
          password.clear();
        } else {
          if (res.statusCode == 200) {
            SharedPreferences pred = await SharedPreferences.getInstance();

            Navigator.of(context, rootNavigator: true).pop('dialog');
            _successRegister(context);

            setState(() {
              // transactionData = jsonDecode(res.body);
              pred.setString("name", data[0]['name']);
              pred.setString("admin_id", data[0]['admin_id']);
              pred.setString("email", data[0]['email']);
              pred.setString("username", data[0]['username']);
              pred.setString("password", data[0]['password']);
            });

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Admin_nav()));
          } else {
            Toast.show("Error occured pls try again!",
                duration: Toast.lengthShort, gravity: Toast.bottom);
          }
        }
      } else {
        _Connectivity();
      }
      setState(() {
        _processing = false;
      });
    }
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

  void _successRegister(context) async {
    SharedPreferences pred = await SharedPreferences.getInstance();
    var name;
    name = pred.getString("name");
    AnimatedSnackBar.rectangle(
      'Status ',
      'Welcome  $name!',
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
      'Incorrect password, pls try again!',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  void _Connectivity() {
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
              new Text("No Internet Connection!"),
            ],
          ),
        );
      },
    );
  }

  void _Validation(String txt, icons) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new Icon(icons, size: 30.0, color: Colors.deepOrange[200]),
              SizedBox(
                width: 20.0,
              ),
              new Text(txt),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 131, 103),
        title: Text(
          "REGISTRATION GUIDELINES",
          style: TextStyle(fontSize: 16, color: kWhite),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kWhiteSmoke, width: 1.5)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    sizedBox,
                    Center(
                        child: Column(
                      children: [
                        Text("Admin Login Page".toUpperCase(),
                            style: TextStyle(fontSize: 18, fontFamily: "Bold")),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Secure Management Login",
                        )
                      ],
                    )),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            sizedBox,
                            sizedBox,
                            Inputs(
                                keyboardType: TextInputType.text,
                                controller: username,
                                hint: "Username",
                                validator: (value) {
                                  if (value == "") {
                                    return "Username is required";
                                  }
                                },
                                obsecure: false,
                                icon: Icon(Icons.person)),
                            sizedBox,
                            Inputs(
                                keyboardType: TextInputType.text,
                                controller: password,
                                hint: "Password",
                                validator: (value) {
                                  if (value == "") {
                                    return "Password is required";
                                  }
                                },
                                obsecure: true,
                                icon: Icon(Icons.lock)),
                            sizedBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: this.value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = this.value;
                                    });
                                  },
                                ),
                                Text("Remember me"),
                              ],
                            ),
                            sizedBox,
                            DefaultButton(
                                color: Color.fromARGB(255, 160, 97, 2),
                                icon: Icons.login_outlined,
                                title: "Login",
                                onPressed: () => login()),
                            sizedBox,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
