import 'package:flutter/material.dart';

import 'constant.dart';

class UserAppBar extends StatelessWidget {
  final name, onPressed;
  const UserAppBar({Key? key, this.name, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "STUDENT REGISTRATION GUIDELINES",
              style: TextStyle(fontFamily: "Bold", color: kWhite, fontSize: 15),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 15,
                color: kWhite,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: onPressed,
            child: Icon(Icons.login_outlined, size: 20),
          ),
        ),
      ],
    );
  }
}
