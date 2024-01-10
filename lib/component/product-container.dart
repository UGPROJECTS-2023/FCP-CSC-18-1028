import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../screen/student/places.dart';
import '../screen/student/prac.dart';
import 'constant.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:page_route_transition/page_route_transition.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// import '../screen/customer/practice.dart';
// import '../screen/customer/view-product.dart';
// import 'constant/constant.dart';

getUserData(query) async {
  // SharedPreferences pred = await SharedPreferences.getInstance();
  try {
    var res = await http.post(Uri.parse(myurl),
        body: {"request": "VIEW LOCATION", "query": query.toString()});

    if (res.statusCode == 200) {
      _launchWebsite(query);
    }
    {
      print("Error");
    }
  } catch (e) {
    print(e);
  }
}

void _launchWebsite(query) async {
  const url =
      'https://aksoft.com.ng/campus_guide/locate.php'; // Replace with the website URL you want to redirect the user to.

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ProductContainer extends StatelessWidget {
  final uuu, url, description, item_id;
  const ProductContainer(this.uuu, this.url, this.description, this.item_id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // PageRouteTransition.effect = TransitionEffect.values[7];
        // PageRouteTransition.push(context, ViewProduct(uuu));
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => ViewItem(item_id, amount)));
      },
      onLongPress: (() {}),
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteSmoke, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width / 2,
              height: 190,
              decoration: BoxDecoration(
                  color: kWhite,
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            // sizedBox,
            Text("$uuu", style: TextStyle(fontSize: 16, fontFamily: "Bold")),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.0,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  description.length > 20
                      ? Text(
                          description.substring(0, 20) + "...",
                          style: TextStyle(
                              // color: kGrey,
                              fontFamily: "Regular"),
                        )
                      : Text(description),
                  SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      getUserData(uuu);
                      // Navigator.of(context) Lunch()
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Lunch()));
                    },
                    child: Text("View location"))),
            sizedBox,
          ],

          // child: Container(child: Text("hhf"))
        ),
      ),
    );
  }
}

class ProductContainer1 extends StatelessWidget {
  final uuu, url, price, ending_date, description, status, item_id, amount;
  const ProductContainer1(this.uuu, this.url, this.price, this.ending_date,
      this.description, this.status, this.item_id, this.amount);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // PageRouteTransition.effect = TransitionEffect.values[7];
        // PageRouteTransition.push(context, ViewProduct(uuu));
      },
      onLongPress: (() {}),
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteSmoke, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: MediaQuery.of(context).size.width / 2,
              height: 190,
              decoration: BoxDecoration(
                  color: kWhite,
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            // sizedBox,
            Text("$uuu", style: TextStyle(fontSize: 16, fontFamily: "Bold")),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Price Per Sit: ",
                      ),
                      Text(
                        "$price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Departure: $ending_date',
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "Regular",
                          // decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Arrival: $status',
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "Regular",
                          // decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  description.length > 20
                      ? Text(
                          description.substring(0, 20) + ".....",
                          style: TextStyle(
                              // color: kGrey,
                              fontFamily: "Regular"),
                        )
                      : Text(description),
                  SizedBox(
                    height: 2.0,
                  ),
                ],
              ),
            ),
            sizedBox,
          ],

          // child: Container(child: Text("hhf"))
        ),
      ),
    );
  }
}
