import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';

class MyAppBar {
  AppBar myappwithLogo(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        //color: Colors.amber,
        child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppComponent.logo,
                  height: 50.h,
                ),
              ],
            )),
      ),
    );
  }
}
