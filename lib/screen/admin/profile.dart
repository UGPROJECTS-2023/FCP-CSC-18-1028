import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/constant.dart';
import '../../component/myContainer.dart';
import '../student/profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var name, email, username, password;
  bool status = false;
  bool status2 = false;
  profile() async {
    SharedPreferences pred = await SharedPreferences.getInstance();
    setState(() {
      name = pred.getString("name");
      email = pred.getString("email");
      username = pred.getString("username");
      password = pred.getString("password");
    });
  }

  @override
  void initState() {
    super.initState();
    profile();
    status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 243, 226),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kGreen,
          title: Text(
            "My profile",
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: 5.0,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: kWhiteSmoke,
                    child: Text("My Profile", style: TextStyle(fontSize: 18))),
                sizedBox,
                name == null
                    ? Container(child: ShowSkelaton())
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            color: kWhite,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    "$name",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: "RobotoBold"),
                                  ),
                                  Text(
                                    "(Administrator)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "PERSONAL INFORMATION",
                                        style: TextStyle(
                                            color: kDefault,
                                            fontFamily: "MontSemiBold"),
                                      )),
                                  sizedBox,
                                  MyContainer(
                                      head1: "Administrator name",
                                      head2: name,
                                      color: kWhite,
                                      btn_text: "",
                                      iconColor: kDefault,
                                      icons: Icons.email_outlined),
                                  sizedBox,
                                  MyContainer(
                                    head1: "Email address",
                                    head2: email,
                                    color: kWhite,
                                    btn_text: "",
                                    iconColor: Colors.blue,
                                    icons: Icons.email_outlined,
                                  ),
                                  sizedBox,
                                  MyContainer(
                                    head1: "Username",
                                    head2: "$username",
                                    color: kWhite,
                                    btn_text: "",
                                    iconColor: Colors.orangeAccent,
                                    icons: Icons.logout_outlined,
                                  ),
                                  sizedBox,
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Card(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 30,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Password",
                                                style: TextStyle(
                                                    color: kWhite,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: kGreen,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: status == false
                                                    ? Text(
                                                        "****",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        "${password}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          status = !status;
                                                        });
                                                      },
                                                      icon: !status
                                                          ? Icon(Icons
                                                              .visibility_off_outlined)
                                                          : Icon(Icons
                                                              .visibility_outlined))),
                                            ],
                                          ),
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
              ])),
        ));
  }
}
