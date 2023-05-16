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

class OrderStatus extends StatefulWidget {
  String orderId;
  String dateTime;
  String number;
  String status;
  OrderStatus({
    super.key,
    required this.orderId,
    required this.dateTime,
    required this.number,
    required this.status,
  });

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  List img = [];
  String? name;
  String? email;
  String? address;
  String? cancelBy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var info = FirebaseFirestore.instance
        .collection("allUser")
        .doc("+91${widget.number}")
        .get()
        .then((value) {
      setState(() {
        name = value["name"];
        email = value["email"];
        print(value);
        address =
            value["address"]["folorNumber"] + " " + value["address"]["pincode"];
      });
    });
    var db = FirebaseFirestore.instance
        .collection("allOrder")
        .doc(widget.orderId)
        .get()
        .then((value) {
      img = value["image"];
      cancelBy = value["cancelBy"];
      setState(() {});
    });
  }

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
                              "$name",
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
                          "$email",
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
                      "$address",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Container(
            padding: EdgeInsets.all(20.sp),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Prescription",
                  style: TextStyle(
                      color: AppComponent.Blue,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                    width: double.infinity,
                    height: 270.h,
                    child: GridView.builder(
                      itemCount: img.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 11.sp,
                          mainAxisSpacing: 11.sp),
                      itemBuilder: (context, index) {
                        return Container(
                          child: InstaImageViewer(
                            child: Image(
                              image: NetworkImage(img[index]),
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  height: 10.h,
                ),
                widget.status == "2" ||
                        widget.status == "3" ||
                        widget.status == "4"
                    ? SizedBox.shrink()
                    : FullButton(
                        title: "Approved Order",
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("allOrder")
                              .doc(widget.orderId)
                              .set({"status": "2"}, SetOptions(merge: true));

                          FirebaseFirestore.instance
                              .collection("allUser")
                              .doc("+91${widget.number}")
                              .collection("order")
                              .doc(widget.orderId)
                              .set({"status": "2"}, SetOptions(merge: true));

                          setState(() {
                            widget.status = "2";
                          });
                        },
                        mycolors: Color.fromARGB(255, 08, 97, 62)),
                SizedBox(
                  height: 10.h,
                ),
                widget.status == "3" ||
                        widget.status == "4" ||
                        widget.status == "1"
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: AppComponent.Blue,
                                side: BorderSide(
                                  color: AppComponent.Green,
                                )),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("allOrder")
                                  .doc(widget.orderId)
                                  .set(
                                      {"status": "4"}, SetOptions(merge: true));

                              FirebaseFirestore.instance
                                  .collection("allUser")
                                  .doc("+91${widget.number}")
                                  .collection("order")
                                  .doc(widget.orderId)
                                  .set(
                                      {"status": "4"}, SetOptions(merge: true));
                              setState(() {
                                widget.status = "4";
                              });
                            },
                            child: Text(
                              "Delivery Completed",
                              style: TextStyle(
                                  color: AppComponent.White,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                SizedBox(
                  height: 10.h,
                ),
                widget.status == "3" || widget.status == "4"
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                    color: Color.fromARGB(255, 156, 25, 21))),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("allOrder")
                                  .doc(widget.orderId)
                                  .set({"status": "3", "cancelBy": "By Me"},
                                      SetOptions(merge: true));

                              FirebaseFirestore.instance
                                  .collection("allUser")
                                  .doc("+91${widget.number}")
                                  .collection("order")
                                  .doc(widget.orderId)
                                  .set({"status": "3", "cancelBy": "By Me"},
                                      SetOptions(merge: true));
                              setState(() {
                                widget.status = "3";
                                cancelBy = "By Me";
                              });
                            },
                            child: Text(
                              "Reject Order",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 156, 25, 21),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          widget.status == "3"
              ? Container(
                  padding: EdgeInsets.only(
                      left: 20.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppComponent.cancel,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Status",
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: AppComponent.Blue,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Cancel Order by $cancelBy",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 156, 25, 21),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : widget.status == "4"
                  ? Container(
                      padding: EdgeInsets.only(
                          left: 20.sp, right: 20.sp, top: 20.sp, bottom: 20.sp),
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppComponent.successfully,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Status",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    color: AppComponent.Blue,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Delivery Successfully Completed",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Color.fromARGB(255, 21, 156, 55),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : SizedBox.shrink()
        ],
      ),
    );
  }
}
