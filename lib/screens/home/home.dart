// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/auth/splash.dart';
import 'package:provider/provider.dart';

import '../../globals/navigation/navigator_services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final NavigatorService _navigatorService = NavigatorService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/Active.png'), label: "1"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/sqf.png'), label: "2"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/cart.png'), label: "3"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/user.png'), label: "4"),
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 46,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/ellipse.png'),
                    ),
                    SizedBox(width: 59.50),
                    Text(
                      "Hello Medha",
                      style: TextStyle(
                        color: Color(0xff595959),
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(width: 59.50),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => SplashScreen()));
                          },
                          icon: Icon(Icons.logout_rounded)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xfff1f1f1),
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Search",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xff595959),
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/search.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // width: 324,
                height: 148,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 105,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.94),
                                    border: Border.all(
                                      color: Color(0xff004578),
                                      width: 0.50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd8d8d8),
                                        blurRadius: 17.36,
                                        offset: Offset(0, 3.47),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 26,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Bookers",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xff004578),
                                          fontSize: 10,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: 105,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.94),
                                    border: Border.all(
                                      color: Color(0xff004578),
                                      width: 0.50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd8d8d8),
                                        blurRadius: 17.36,
                                        offset: Offset(0, 3.47),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 24,
                                    right: 23,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Auctioneers",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xff004578),
                                          fontSize: 10,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: 105,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.94),
                                    border: Border.all(
                                      color: Color(0xff004578),
                                      width: 0.50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd8d8d8),
                                        blurRadius: 17.36,
                                        offset: Offset(0, 3.47),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 26,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Clearing Agents",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xff004578),
                                          fontSize: 10,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      // width: 212,
                      height: 64,
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 105,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.94),
                                    border: Border.all(
                                      color: Color(0xff004578),
                                      width: 0.50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd8d8d8),
                                        blurRadius: 17.36,
                                        offset: Offset(0, 3.47),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 26,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Forwarding",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xff004578),
                                          fontSize: 10,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: 105,
                            height: 64,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 105,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.94),
                                    border: Border.all(
                                      color: Color(0xff004578),
                                      width: 0.50,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd8d8d8),
                                        blurRadius: 17.36,
                                        offset: Offset(0, 3.47),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 26,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Commission",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Color(0xff004578),
                                          fontSize: 10,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recomended for you",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xff595959),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 7.65),
                  Text(
                    "View more",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xff004578),
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 7.65),
                        Container(
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x07000000),
                                blurRadius: 5.32,
                                offset: Offset(0, 6.65),
                              ),
                              BoxShadow(
                                color: Color(0x0a000000),
                                blurRadius: 17.87,
                                offset: Offset(0, 22.34),
                              ),
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 80,
                                offset: Offset(0, 100),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(
                            left: 11,
                            // right: 153,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 44,
                                padding: const EdgeInsets.only(
                                  right: 8,
                                  bottom: 1,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expert Technicians",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Trained Experienced Trusted",
                                      style: TextStyle(
                                        color: Color(0xff595959),
                                        fontSize: 10,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/Person.png',
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 7.65),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 7.65),
                        Container(
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x07000000),
                                blurRadius: 5.32,
                                offset: Offset(0, 6.65),
                              ),
                              BoxShadow(
                                color: Color(0x0a000000),
                                blurRadius: 17.87,
                                offset: Offset(0, 22.34),
                              ),
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 80,
                                offset: Offset(0, 100),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(
                            left: 11,
                            // right: 153,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 44,
                                padding: const EdgeInsets.only(
                                  right: 8,
                                  bottom: 1,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Expert Technicians",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Trained Experienced Trusted",
                                      style: TextStyle(
                                        color: Color(0xff595959),
                                        fontSize: 10,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/Person.png',
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 7.65),
                      ],
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
