import 'package:flutter/material.dart';

import 'constant.dart';

class CustomerContainer extends StatelessWidget {
  final title,
      dates,
      qty,
      mfd,
      expire,
      status,
      from,
      to,
      reject,
      onPressed,
      percentage,
      price,
      date,
      icon,
      subtitle,
      onTap,
      username;

  final int counter;
  // final double percentageNo;
  const CustomerContainer({
    Key? key,
    this.title,
    this.status,
    this.reject,
    this.price,
    this.dates,
    this.username,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.icon,
    this.date,
    this.mfd,
    this.expire,
    this.qty,
    this.percentage,
    this.from,
    this.to,
    // required this.percentageNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String b = "";
    // String bq = ".0";
    for (int i = 0; i < percentage.length; i++) {
      b = percentage[0];
      // b = 0;
    }
    String v = "0.$b";
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: kWhiteSmoke),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.1),
                offset: Offset(2, 2),
                blurRadius: 2,
                spreadRadius: 5,
              )
            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Text("$date"),
                ),
                Divider(
                  thickness: 1.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SafeArea(
                      child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(title,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(" / NGN$price")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Available Qyt: "),
                                      Text(" $qty",
                                          style: TextStyle(
                                              fontSize: 18, color: kGreen))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'MFD: ',
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text("$mfd")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "EXPIRE DATE: ",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text("$expire"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Status "),
                                      CircleAvatar(
                                        radius: 2.0,
                                      ),
                                      SizedBox(width: 3.0),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Remain days to Expire: "),
                                      Text(" days",
                                          style: TextStyle(
                                              color: kGreen, fontSize: 16))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // Text(""),
                          ]),
                    )),
              ]),
        ),
      ),
    );
  }
}

class DashContainer1 extends StatelessWidget {
  final title, icon, description, route, values;
  bool status;
  DashContainer1(
      {this.title,
      this.icon,
      this.description,
      this.route,
      required this.status,
      this.values});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Color.fromRGBO(220, 250, 233, 0.6),
        child: InkWell(
          highlightColor: Colors.blue.withOpacity(0.3),
          onTap: route,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "$icon",
                height: 50,
              ),
              SizedBox(
                height: 10.0,
              ),
              status == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("("),
                        Text("$values",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700)),
                        Text(")")
                      ],
                    )
                  : Text(""),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Divider(),
              ),
              Text(
                "$title".toUpperCase(),
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: kGreen,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
