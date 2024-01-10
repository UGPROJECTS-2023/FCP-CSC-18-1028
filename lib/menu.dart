import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dietician/screen/student/login.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import 'component/button.dart';
import 'component/constant.dart';
import 'screen/admin/admin-login.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 70,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("FUD STUDENT REGISTRATION GUIDELINES",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontFamily: "Bold")),
                  ]),
              SizedBox(
                height: 110,
              ),
              Container(
                child: Image(
                  image: AssetImage("assets/images/fud_logo.png"),
                  height: 270,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              // Text("Accreditated By NBTE"),
              // Image.asset("assets/images/nbte.png"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    DefaultButton(
                      color: kGreen,
                      icon: Icons.login_outlined,
                      title: "Student login",
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => Login()))),
                    ),
                    sizedBox,
                    sizedBox,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kWhiteSmoke,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1.5, color: kGreen)),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide.none),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => AdminLogin())));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login_outlined,
                              color: kDefault,
                              size: 17,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Management Login",
                              style: TextStyle(
                                color: kDefault,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
