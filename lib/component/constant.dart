import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

final kWhite = Colors.white;
final kBlack = Colors.black;
final kDefault0 = Color.fromARGB(255, 2, 61, 48);
final kDefault1 = Color.fromARGB(255, 228, 138, 4);
final kDefault2 = Color.fromARGB(255, 9, 78, 12);
final kGrey = Colors.grey;
final kWhiteSmoke = Color.fromARGB(255, 245, 242, 242);
// final font1 =
final smallSize = SizedBox(
  height: 10.0,
);

final mediumSize = SizedBox(
  height: 30.0,
);

final BigSize = SizedBox(
  height: 50.0,
);

final kDefault = Color.fromARGB(255, 8, 83, 10);
final kGreen = Color.fromARGB(255, 17, 98, 19);
final kBlue = Colors.blue;
final kPurpule = Colors.purple;
final kRed = Color.fromARGB(255, 158, 8, 58);
final sizedBox = SizedBox(height: 10);
String myurl =
    "https://aksoft.com.ng/flutterApps2023/campusRegistration/index.php";
// String myurl =    "http://192.168.218.17/2023-2024-app/campusRegistration/index.php";
String imgurl =
    "https://aksoft.com.ng/flutterApps2023/campusRegistration/images/";
// String imgurl = "https://aksoft.com.ng/flutter_apps/campus_guide/images/";
// http://192.168.43.233/2020-2021-app/dietitian/index.php";

void _success(context) {
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

void successAlert(context, title) {
  CoolAlert.show(
      context: context,
      backgroundColor: Colors.green,
      type: CoolAlertType.success,
      text: title);
}

void warningAlert(context, title) {
  CoolAlert.show(
      context: context,
      backgroundColor: Colors.deepOrangeAccent,
      type: CoolAlertType.warning,
      text: title);
}

void loadingAlert(context) {
  CoolAlert.show(
      barrierDismissible: false,
      context: context,
      type: CoolAlertType.loading,
      text: "Loading...");
}

void loadingProcess(context, title) {
  CoolAlert.show(
      barrierDismissible: false,
      context: context,
      type: CoolAlertType.loading,
      text: "$title");
}
