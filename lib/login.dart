import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/fullButton.dart';
import 'package:generic_medicine_admin/home.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool sendOTP = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(children: [
              Container(
                color: AppComponent.White,
                height: 500.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SvgPicture.asset(
                      AppComponent.logo,
                      height: 70.sp,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 390.h,
                        child: SvgPicture.asset(
                          AppComponent.login,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.h, 30.h, 30.h, 10.h),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30.h,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Form(
                          key: _form,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _email,
                                cursorColor: AppComponent.Blue,
                                decoration: InputDecoration(
                                    prefixIcon: Container(
                                      width: 10.h,
                                      child: Center(
                                          child: SvgPicture.asset(
                                              AppComponent.email)),
                                    ),
                                    hintText: "Enter you Email address",
                                    hintStyle: TextStyle(
                                        fontSize: 20.sp,
                                        color:
                                            Color.fromARGB(255, 201, 201, 201)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 235, 235, 235))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: AppComponent.Blue))),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _password,
                                cursorColor: AppComponent.Blue,
                                decoration: InputDecoration(
                                    suffixIcon: Container(
                                      width: 10.h,
                                      child: Center(
                                          child: SvgPicture.asset(
                                              AppComponent.eye)),
                                    ),
                                    prefixIcon: Container(
                                      width: 10.h,
                                      child: Center(
                                          child: SvgPicture.asset(
                                              AppComponent.password)),
                                    ),
                                    hintText: "Enter Password  ",
                                    hintStyle: TextStyle(
                                        fontSize: 20.sp,
                                        color:
                                            Color.fromARGB(255, 201, 201, 201)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 235, 235, 235))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                            color: AppComponent.Blue))),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 56, 101),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.85))),
                          onPressed: () async {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            });
                          },
                          child: Center(
                            child: loading
                                ? CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login Now",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
