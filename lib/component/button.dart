import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constant.dart';

class DefaultButton extends StatelessWidget {
  final icon, title, color, onPressed;
  const DefaultButton({
    Key? key,
    this.icon,
    this.color,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(side: BorderSide.none),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: kWhite,
              size: 17,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: kWhite,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
