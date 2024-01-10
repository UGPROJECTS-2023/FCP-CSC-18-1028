import 'package:flutter/material.dart';

import 'constant.dart';


class AdminContainer extends StatelessWidget {
  final title, onPressed, icon, subtitle, onTap;

  final int counter;
  const AdminContainer({
    Key? key,
    this.title,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: kWhiteSmoke),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 2),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("img/kasuLogo3.jpg")),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kWhiteSmoke),
                ),
              ),
              title: Text(title,
                  style: TextStyle(fontFamily: "Bold", fontSize: 13)),
              subtitle: Text(
                '${subtitle}',
                style: TextStyle(color: kRed),
              ),
              trailing: ElevatedButton(
                onPressed: onPressed,
                child: Text('Record', style: TextStyle()),
              ),
            ),
          ),
        ));
  }
}

class MonitorPerformance extends StatelessWidget {
  final title, onPressed, icon, subtitle, onTap;

  final int counter;
  const MonitorPerformance({
    Key? key,
    this.title,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: kWhiteSmoke),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 2),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("img/kasuLogo3.jpg")),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kWhiteSmoke),
                ),
              ),
              title: Text(title,
                  style: TextStyle(fontFamily: "Bold", fontSize: 13)),
              subtitle: Text(
                '${subtitle}',
                style: TextStyle(color: kRed),
              ),
              trailing: ElevatedButton(
                onPressed: onPressed,
                child: Text('Monitor', style: TextStyle()),
              ),
            ),
          ),
        ));
  }
}

class MyPupilContainer extends StatelessWidget {
  final title, onPressed, subtitle2, subtitle, onTap;

  final int counter;
  const MyPupilContainer({
    Key? key,
    this.title,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.subtitle2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: kWhiteSmoke),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 2),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("img/kasuLogo3.jpg")),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kWhiteSmoke),
                ),
              ),
              title: Text(title,
                  style: TextStyle(fontFamily: "Bold", fontSize: 13)),
              subtitle: Text(
                '${subtitle}',
                style: TextStyle(color: kRed),
              ),
              trailing: Text(subtitle2),
            ),
          ),
        ));
  }
}

class ChildContainer extends StatelessWidget {
  final title, onPressed, icon, subtitle, onTap;

  final int counter;
  const ChildContainer({
    Key? key,
    this.title,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: kWhiteSmoke),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(3, 2),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              ],
            ),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("img/user.jpg")),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kWhiteSmoke),
                ),
              ),
              title: Text(title,
                  style: TextStyle(fontFamily: "Bold", fontSize: 13)),
              subtitle: Text(
                '${subtitle}',
                style: TextStyle(color: kRed),
              ),
              trailing: ElevatedButton(
                onPressed: onPressed,
                child: Text('Add child', style: TextStyle()),
              ),
            ),
          ),
        ));
  }
}

class ParentContainer extends StatelessWidget {
  final title, onPressed, icon, subtitle, onTap;

  final int counter;
  const ParentContainer({
    Key? key,
    this.title,
    this.onPressed,
    this.subtitle,
    required this.counter,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: kWhiteSmoke),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(3, 2),
                blurRadius: 2,
                spreadRadius: 3,
              )
            ],
          ),
          child: ListTile(
            leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kWhiteSmoke),
                ),
                child: Center(
                    child: Text(
                  '$counter',
                  style: TextStyle(color: kWhite, fontSize: 16),
                ))),
            title: Text(title, style: TextStyle(fontFamily: "Bold")),
            subtitle: Text(
              '${subtitle}',
              style: TextStyle(color: kRed),
            ),
            trailing: icon,
          ),
        ),
      ),
    );
  }
}
