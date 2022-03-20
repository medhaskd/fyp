// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/globals/navigation/navigator_services.dart';
import 'package:fyp/screens/auth/signup.dart';
import 'package:fyp/screens/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController(),
      password = TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void login() async {
    if (_formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
      } on FirebaseAuthException catch (e, _) {
        NavigatorService().showSnackbar(context, e.message);
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
          child: Form(
            key: _formKey,
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
                  "Login to your Account",
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
                    TextFormField(
                      controller: email,
                      validator: (s) {
                        if (s.isEmpty) {
                          return "* Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter registered email id',
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
                    SizedBox(height: 29.20),
                    TextFormField(
                      controller: password,
                      validator: (s) {
                        if (s.isEmpty) {
                          return "* Required";
                        }
                        return null;
                      },
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
                    SizedBox(height: 29.20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xff1976d2),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "LOGIN",
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
                      "- or login with -",
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
                        "New Here?",
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
                              MaterialPageRoute(builder: (ctx) => Signup()))
                        },
                        child: Text(
                          "Register Now",
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
        ),
      )),
    );
  }
}
