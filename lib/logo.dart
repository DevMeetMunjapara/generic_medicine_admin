import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/Login.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerScreen();
  }

  timerScreen() async {
    await Future.delayed(Duration(seconds: 2), () async {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppComponent.Yellow,
      body: Center(
          child: SvgPicture.asset(
        AppComponent.introLogo,
        width: 180.sp,
      )),
    );
  }
}
