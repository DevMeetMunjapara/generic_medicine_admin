import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/fullButton.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
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
                          fit: BoxFit.fill,
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
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                                fontSize: 22.h,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 22.h,
                                  color: AppComponent.Green,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Form(
                          key: _form,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: mobileNumber,
                            cursorColor: AppComponent.Green,
                            decoration: InputDecoration(
                                prefixIcon: Container(
                                  //color: Colors.amber,
                                  width: 10.h,
                                  child: Center(
                                    child: Text(
                                      "+91",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                hintText: "Enter 10 digit mobile number",
                                hintStyle: TextStyle(fontSize: 20.sp),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 235, 235, 235))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide:
                                        BorderSide(color: AppComponent.Green))),
                            validator: (value) {
                              if (value == "") {
                                return "Enter Mobile Number";
                              }
                              if (value!.length != 10) {
                                return 'Only 10 digit number valid';
                              }
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      FullButton(
                        title: "Get verification code",
                        loading: loading,
                        onPressed: () async {
                          bool result =
                              await InternetConnectionChecker().hasConnection;
                          if (result == true) {
                            print('---------YAY! Free cute dog pics!');
                            if (_form.currentState!.validate()) {}
                          }
                        },
                        mycolors: AppComponent.Green,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "By signing in you agree to our",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Color.fromARGB(255, 126, 126, 126)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "terms & conditions ",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppComponent.NevyBlue,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "and ",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Color.fromARGB(255, 126, 126, 126)),
                          ),
                          Text(
                            "Privacy policy",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppComponent.NevyBlue,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
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
