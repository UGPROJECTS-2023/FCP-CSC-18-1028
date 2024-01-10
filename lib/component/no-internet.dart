import 'dart:io';

import 'package:dietician/component/constant.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dietician/component/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends StatefulWidget {
  NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  String _platformVersion = 'Unknown';
  bool hasInternet = false;

  void _success() {
    AnimatedSnackBar.rectangle(
      'Connected',
      'Back to Online!',
      type: AnimatedSnackBarType.success,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) => {
          hasInternet = status == InternetConnectionStatus.connected,
          setState(() {
            this.hasInternet = hasInternet;
            // hasInternet == true ? _success() : _warning();

            if (hasInternet) {
              _success();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SplashAfter(),
              ));
            } else {
              // Timer(Duration(seconds: 5), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NoInternet()),
              );
              // });
              // InternetPopup().initialize(
              //   context: context,
              //   onTapPop: true,
              // );
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(systemNavigationBarColor: Colors.green);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Stack(
          children: [
            // Text('Running on: $_platformVersion\n'),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 100),
              child: Lottie.asset('assets/images/am-loading.json', width: 300),
            ),
            BigSize,
            BigSize,
            BigSize,
            Padding(
              padding:
                  const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      mediumSize,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("assets/images/wifi.jpg"),
                            width: 70,
                          ),
                          Text(
                            "You're Offline",
                            style: TextStyle(fontFamily: "bold", fontSize: 18),
                          ),
                        ],
                      ),
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 20.0, left: 10, right: 10.0),
                          child: Center(
                            child: Text(
                                "To use ODfel Chatbot App, turn on mobile data \nor connect to Wi-fi network"),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                                onPressed: () {
                                  FlutterExitApp.exitApp();
                                  exit(0);
                                  // Navigator.of(context).pop();
                                },
                                child: Text("OK"))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondNoInternet extends StatefulWidget {
  SecondNoInternet({Key? key}) : super(key: key);

  @override
  State<SecondNoInternet> createState() => _SecondNoInternetState();
}

class _SecondNoInternetState extends State<SecondNoInternet> {
  String _platformVersion = 'Unknown';
  bool hasInternet = false;

  void _success() {
    AnimatedSnackBar.rectangle(
      'Connected',
      'Back to Online!',
      type: AnimatedSnackBarType.success,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) => {
          hasInternet = status == InternetConnectionStatus.connected,
          setState(() {
            this.hasInternet = hasInternet;
            // hasInternet == true ? _success() : _warning();

            if (hasInternet) {
              _success();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SecondSplashAfter(),
              ));
            } else {
              // Timer(Duration(seconds: 5), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SecondNoInternet()),
              );
              // });
              // InternetPopup().initialize(
              //   context: context,
              //   onTapPop: true,
              // );
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(systemNavigationBarColor: Colors.green);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Stack(
          children: [
            // Text('Running on: $_platformVersion\n'),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 100),
              child: Lottie.asset('assets/images/am-loading.json', width: 300),
            ),
            BigSize,
            BigSize,
            BigSize,
            Padding(
              padding:
                  const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(3, 2),
                        blurRadius: 4,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      mediumSize,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage("assets/images/wifi.jpg"),
                            width: 70,
                          ),
                          Text(
                            "You're Offline",
                            style: TextStyle(fontFamily: "bold", fontSize: 18),
                          ),
                        ],
                      ),
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 20.0, left: 10, right: 10.0),
                          child: Center(
                            child: Text(
                                "To use ODfel Chatbot App, turn on mobile data \nor connect to Wi-fi network"),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: OutlinedButton(
                                onPressed: () {
                                  FlutterExitApp.exitApp();
                                  exit(0);
                                  // Navigator.of(context).pop();
                                },
                                child: Text("OK"))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
