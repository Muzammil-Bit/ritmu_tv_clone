import 'package:flutter/material.dart';

final primaryColor = Color(0xff100C34);
Widget customAppbar() {
  return AppBar(
    backgroundColor: primaryColor,
    leading: Icon(Icons.tv),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Image.asset(
          'assets/tv.png',
          color: Colors.white,
          height: 20,
          width: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Image.asset(
          'assets/home.png',
          color: Colors.white,
          height: 20,
          width: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Image.asset(
          'assets/refresh.png',
          color: Colors.white,
          height: 18,
          width: 18,
        ),
      ),
    ],
  );
}
