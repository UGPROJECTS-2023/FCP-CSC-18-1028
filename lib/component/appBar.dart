import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constant.dart';

class DefaultAppBar extends StatelessWidget {
  final title;
  const DefaultAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: kDefault,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: kWhite,
                      )),
                  Text(title,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kWhite,
                          fontFamily: "RobotoBold")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: Divider(
                  color: kRed,
                  thickness: 1.0,
                ),
              ),
              // Text("Practical Manual Purchasing",
              //     style: TextStyle(
              //       fontSize: 15.0,
              //       color: kWhite,
              //     )),
            ],
          ),
        ));
  }
}
