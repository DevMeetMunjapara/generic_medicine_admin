import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 960),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
            // scaffoldBackgroundColor: AppComponent.White,
            fontFamily: "DMSans",
          ),
          routes: {
            "/": (context) => Logo(),
          },
        );
      },
    );
  }
}
