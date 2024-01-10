import 'dart:async';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dietician/component/constant.dart';
import 'package:dietician/component/no-internet.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../main.dart';
import '../menu.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isLoading = false;
  bool hasInternet = false;

  void _warning() {
    AnimatedSnackBar.rectangle(
      'Warning',
      'It seem that You are OFFLINE!',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  void _success() {
    AnimatedSnackBar.rectangle(
      'Success',
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
            if (this.hasInternet == true) {
              Timer(Duration(seconds: 6), () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Menu(),
                ));
              });
            } else {
              Timer(Duration(seconds: 5), () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NoInternet()),
                );
              });
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/fud_logo.png",
                  height: 110,
                ),

                // Image(
                //   image: AssetImage("assets/images/images/new.png"),
                //   width: 150,
                //   height: 50,
                // ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTRATION",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "GUIDELINES",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                const Text(
                  "Powered by HANGA ALAMIN NASIR - FCP/CSC/18/1028",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(hasInternet ? "Network is available" : "No connection"),
                const SizedBox(
                  height: 100,
                ),
                LoadingAnimationWidget.hexagonDots(
                  color: Color.fromARGB(255, 245, 148, 2),
                  // rightDotColor: const Color(0xFFEA3799),
                  size: 50,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height),
      ),
    );
  }
}

class SplashAfter extends StatefulWidget {
  SplashAfter({Key? key}) : super(key: key);

  @override
  State<SplashAfter> createState() => _SplashAfterState();
}

class _SplashAfterState extends State<SplashAfter> {
  bool isLoading = false;
  bool hasInternet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Menu(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/fud_logo.png",
                  height: 110,
                ),

                // Image(
                //   image: AssetImage("assets/images/images/new.png"),
                //   width: 150,
                //   height: 50,
                // ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTRATION",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "GUIDELINES",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                const Text(
                  "Powered by HANGA ALAMIN NASIR - FCP/CSC/18/1028",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(hasInternet ? "Network is available" : "No connection"),
                const SizedBox(
                  height: 100,
                ),
                LoadingAnimationWidget.hexagonDots(
                  color: Color.fromARGB(255, 184, 113, 6),
                  // rightDotColor: const Color(0xFFEA3799),
                  size: 50,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height),
      ),
    );
  }
}

class SecondSplash extends StatefulWidget {
  SecondSplash({Key? key}) : super(key: key);

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  bool isLoading = false;
  bool hasInternet = false;

  void _warning() {
    AnimatedSnackBar.rectangle(
      'Warning',
      'It seem that You are OFFLINE!',
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.light,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(
      context,
    );
  }

  void _success() {
    AnimatedSnackBar.rectangle(
      'Warning',
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
            if (this.hasInternet == true) {
              Timer(Duration(seconds: 6), () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Student_nav(),
                ));
              });
            } else {
              Timer(Duration(seconds: 5), () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SecondNoInternet()),
                );
              });
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/fud_logo.png",
                  height: 110,
                ),

                // Image(
                //   image: AssetImage("assets/images/images/new.png"),
                //   width: 150,
                //   height: 50,
                // ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTRATION",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "GUIDELINES",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                const Text(
                  "Powered by HANGA ALAMIN NASIR - FCP/CSC/18/1028",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(hasInternet ? "Network is available" : "No connection"),
                const SizedBox(
                  height: 100,
                ),
                LoadingAnimationWidget.hexagonDots(
                  color: Color.fromARGB(255, 245, 148, 2),
                  // rightDotColor: const Color(0xFFEA3799),
                  size: 50,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height),
      ),
    );
  }
}

class SecondSplashAfter extends StatefulWidget {
  SecondSplashAfter({Key? key}) : super(key: key);

  @override
  State<SecondSplashAfter> createState() => _SecondSplashAfterState();
}

class _SecondSplashAfterState extends State<SecondSplashAfter> {
  bool isLoading = false;
  bool hasInternet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Student_nav(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/fud_logo.png",
                  height: 110,
                ),

                // Image(
                //   image: AssetImage("assets/images/images/new.png"),
                //   width: 150,
                //   height: 50,
                // ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "REGISTRATION",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "GUIDELINES",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                sizedBox,
                sizedBox,
                const Text(
                  "Powered by HANGA ALAMIN NASIR - FCP/CSC/18/1028",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                // Text(hasInternet ? "Network is available" : "No connection"),
                const SizedBox(
                  height: 100,
                ),
                LoadingAnimationWidget.hexagonDots(
                  color: Color.fromARGB(255, 245, 148, 2),
                  // rightDotColor: const Color(0xFFEA3799),
                  size: 50,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height),
      ),
    );
  }
}
