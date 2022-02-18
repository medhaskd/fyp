// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screens/auth/login.dart';
import 'package:fyp/screens/auth/signup.dart';
import 'package:fyp/screens/home/home.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController(),
      password = TextEditingController(),
      cPassword = TextEditingController();
  bool isLoading = false;
  login() async {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        cPassword.text == password.text) {
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset('assets/Logo.png'),
              SizedBox(height: 29.33),
              Text(
                "Create your Account",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xff595959),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 29.33),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email id',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      cursorColor: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 29.20),
                  Container(
                    height: 45,
                    child: TextField(
                      controller: password,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      cursorColor: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 29.20),
                  Container(
                    height: 45,
                    child: TextField(
                      controller: cPassword,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Re-enter password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      cursorColor: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 29.20),
                  SizedBox(height: 29.20),
                  isLoading
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: login,
                          child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "SIGN UP",
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
                    GestureDetector(
                      onTap: () => {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => LoginScreen()))
                      },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color(0xff1976d2),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
