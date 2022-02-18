// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Logo.png'),
          SizedBox(height: 29.33),
          Text(
            "Create an Account",
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Color(0xff595959),
              fontSize: 18,
            ),
          ),
          SizedBox(height: 29.33),
          Container(
            height: 341,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xfff1f1f1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 229,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Enter Email",
                              style: TextStyle(
                                color: Color(0xffcecece),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.20),
                Container(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xfff1f1f1),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 198,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Enter Password",
                              style: TextStyle(
                                color: Color(0xffcecece),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.20),
                SizedBox(height: 29.20),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0f000000),
                              blurRadius: 1.65,
                              offset: Offset(0, 1.95),
                            ),
                            BoxShadow(
                              color: Color(0x0c000000),
                              blurRadius: 3.76,
                              offset: Offset(0, 4.44),
                            ),
                            BoxShadow(
                              color: Color(0x0b000000),
                              blurRadius: 6.54,
                              offset: Offset(0, 7.72),
                            ),
                          ],
                          color: Color(0xff1976d2),
                        ),
                        padding: const EdgeInsets.only(
                          left: 44,
                          right: 45,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.20),
                Text(
                  "- or signup with -",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xffcecece),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 29.20),
                Container(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png'),
                      SizedBox(
                        width: 25.0,
                      ),
                      Image.asset('assets/apple.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 29.33),
          Container(
            width: 160,
            height: 16,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Login",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xff1976d2),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
