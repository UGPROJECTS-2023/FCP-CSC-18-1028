import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constant.dart';

class SmallContainer extends StatelessWidget {
  final txt, icon, onTap;
  const SmallContainer({Key? key, this.txt, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteSmoke,
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              offset: Offset(3, 2),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: kDefault,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      sizedBox,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          txt,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios_outlined, color: kDefault)
            ],
          ),
        ),
      ),
    );
  }
}

class ListContainer1 extends StatelessWidget {
  final title,
      dates,
      driver_name,
      onPressed,
      price,
      subtitle,
      viewBidder,
      prescribe,
      license_no,
      departure,
      destination;

  final int counter;
  const ListContainer1({
    Key? key,
    this.title,
    this.price,
    this.dates,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.license_no,
    this.departure,
    this.destination,
    this.driver_name,
    this.viewBidder,
    this.prescribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: kWhiteSmoke),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(3, 2),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Item name:"),
                                Text("Minimum amount:"),
                                Text("Ending date:"),
                                Text("Item status:"),
                                // Text("Chasis number"),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("$title",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Bold")),
                                      // Text(" / $price")
                                    ],
                                  ),
                                  Text(
                                    "$driver_name",
                                    style: TextStyle(fontFamily: "Bold"),
                                  ),
                                  Text(
                                    "$departure",
                                    style: TextStyle(fontFamily: "Bold"),
                                  ),
                                  license_no == "sold"
                                      ? Text(
                                          "$license_no",
                                          style: TextStyle(
                                            fontFamily: "Bold",
                                            color: kRed,
                                          ),
                                        )
                                      : Text("$license_no",
                                          style: TextStyle(
                                            fontFamily: "Bold",
                                            color: kDefault,
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    color: Color.fromARGB(255, 155, 94, 2),
                    child: TextButton(
                      onPressed: prescribe,
                      child:
                          Text("Delete Item", style: TextStyle(color: kWhite)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: kBlue,
                        // ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    child: Container(
                      color: kDefault,
                      child: TextButton(
                        // style: ButtonStyle(backgroundColor: kRed),
                        onPressed: viewBidder,
                        child: Text("Highest Bidder",
                            style: TextStyle(color: kWhite)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListContainer2 extends StatelessWidget {
  final title,
      dates,
      driver_name,
      onPressed,
      price,
      subtitle,
      viewBidder,
      prescribe,
      license_no,
      departure,
      destination;

  final int counter;
  const ListContainer2({
    Key? key,
    this.title,
    this.price,
    this.dates,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.license_no,
    this.departure,
    this.destination,
    this.driver_name,
    this.viewBidder,
    this.prescribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: kWhiteSmoke),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(3, 2),
              blurRadius: 2,
              spreadRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Item name:"),
                                Text("Minimum amount:"),
                                Text("Ending date:"),
                                Text("Item status:"),
                                // Text("Chasis number"),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("$title",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Bold")),
                                      // Text(" / $price")
                                    ],
                                  ),
                                  Text(
                                    "$driver_name",
                                    style: TextStyle(fontFamily: "Bold"),
                                  ),
                                  Text(
                                    "$departure",
                                    style: TextStyle(fontFamily: "Bold"),
                                  ),
                                  license_no == "sold"
                                      ? Text(
                                          "$license_no",
                                          style: TextStyle(
                                            fontFamily: "Bold",
                                            color: kRed,
                                          ),
                                        )
                                      : Text("$license_no",
                                          style: TextStyle(
                                            fontFamily: "Bold",
                                            color: kDefault,
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
              sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    color: Color.fromARGB(255, 155, 94, 2),
                    child: TextButton(
                      onPressed: prescribe,
                      child:
                          Text("Bidding out", style: TextStyle(color: kWhite)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: kBlue,
                        // ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 30,
                    child: Container(
                      color: kDefault,
                      child: TextButton(
                        // style: ButtonStyle(backgroundColor: kRed),
                        onPressed: viewBidder,
                        child: Text("Highest Bidder",
                            style: TextStyle(color: kWhite)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
