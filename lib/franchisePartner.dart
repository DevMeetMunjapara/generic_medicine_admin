import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/appbar.dart';
import 'package:generic_medicine_admin/CustomWidget/fullButton.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class FranchisePartner extends StatefulWidget {
  String orderId;
  String dateTime;
  String name;
  String number;
  String email;
  String address;
  String readMass;
  FranchisePartner({
    super.key,
    required this.orderId,
    required this.dateTime,
    required this.name,
    required this.number,
    required this.email,
    required this.address,
    required this.readMass,
  });

  @override
  State<FranchisePartner> createState() => _FranchisePartnerState();
}

class _FranchisePartnerState extends State<FranchisePartner> {
  String? name;
  String? email;
  String? address;
  String? number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar().myappwithLogo(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.sp, left: 20.sp),
            child: Text(
              "Order ID : ${widget.orderId}",
              style: TextStyle(
                  color: AppComponent.Blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.sp),
            child: Text(
              "${widget.dateTime}",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 58, 56), fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Material(
            elevation: 2,
            child: Container(
                padding: EdgeInsets.all(20.sp),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppComponent.user,
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  color: AppComponent.Blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 2.sp,
                            ),
                            Text(
                              "+91 ${widget.number}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 54, 58, 56),
                                  fontSize: 18.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 139, 139, 139)),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Customer Address",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 139, 139, 139)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      widget.address,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20.sp,
          ),
          widget.readMass == "0"
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FullButton(
                      title: "Read successfully",
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("allpartner")
                            .doc(widget.orderId)
                            .set({"readMass": "1"}, SetOptions(merge: true));
                        setState(() {
                          widget.readMass = "1";
                        });
                      },
                      mycolors: AppComponent.Green),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
