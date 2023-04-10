import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullButton extends StatelessWidget {
  late final String title;
  late final VoidCallback onPressed;
  late final bool loading;
  late final Color mycolors;

  FullButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.mycolors,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: mycolors,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.85))),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
                ),
        ),
      ),
    );
  }
}
