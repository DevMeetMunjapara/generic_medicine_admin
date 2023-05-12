import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/appbar.dart';
import 'package:generic_medicine_admin/orderstatus.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = FirebaseFirestore.instance.collection("allOrder");
  String? formattedDate;
  TextEditingController _number = TextEditingController(text: "10");
  int isArrow = 1;
  String itemSelected = "All";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppComponent.Yellow,
        appBar: MyAppBar().myappwithLogo(context),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detailed Report",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppComponent.Green),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "These orders have been confirm during Period date.",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromARGB(255, 117, 122, 120)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2024));
                              setState(() {
                                formattedDate =
                                    DateFormat('dd/MM/yyyy').format(dateTime!);
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 251, 250, 250),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Color.fromARGB(
                                            255, 226, 226, 226))),
                                height: 35.h,
                                width: 168.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppComponent.calendar,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      formattedDate == null
                                          ? "DD/MM/YYYY"
                                          : "$formattedDate",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 192, 192, 192),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Status",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          DropdownButton(
                            value: itemSelected,
                            dropdownColor: Colors.white,
                            items: const [
                              DropdownMenuItem(
                                value: "All",
                                child: Text("All"),
                              ),
                              DropdownMenuItem(
                                value: "Pandding",
                                child: Text("Pandding"),
                              ),
                              DropdownMenuItem(
                                value: "Approve",
                                child: Text("Approve"),
                              ),
                              DropdownMenuItem(
                                value: "Reject",
                                child: Text("Reject"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                itemSelected = value!;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        children: [
                          const Text(
                            "",
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                formattedDate = null;
                                itemSelected = "All";
                              });
                            },
                            child: Text(
                              "Reset filter",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppComponent.Blue),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              width: double.infinity,
              height: 55.h,
              color: Color.fromARGB(255, 251, 250, 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 0.1.sw,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        "No.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.2.sw,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Order ID",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.25.sw,
                    height: double.infinity,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date & Time",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.sp),
                      ),
                    ),
                  ),
                  Text(
                    "View All Report",
                    style: TextStyle(
                        color: AppComponent.Blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 520.h,
              width: double.infinity,
              child: StreamBuilder(
                stream: db.snapshots(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      String dateString = snapshot.data!.docs[index]["time"];
                      String date = snapshot.data!.docs[index]["time"];

                      DateTime dateTime = DateTime.parse(dateString);

                      String myDate = DateFormat('dd/MM/yyyy').format(dateTime);
                      String myTime = DateFormat.jm().format(dateTime);
                      print("------$myDate");
                      print(formattedDate);
                      if (myDate == formattedDate && formattedDate != null) {
                        if (itemSelected == "Pandding" &&
                            snapshot.data!.docs[index]["status"] == "1") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "Approve" &&
                            snapshot.data!.docs[index]["status"] == "2") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "Reject" &&
                            snapshot.data!.docs[index]["status"] == "3") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "All") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                      }
                      if (formattedDate == null) {
                        if (itemSelected == "Pandding" &&
                            snapshot.data!.docs[index]["status"] == "1") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "Approve" &&
                            snapshot.data!.docs[index]["status"] == "2") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "Reject" &&
                            snapshot.data!.docs[index]["status"] == "3") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                        if (itemSelected == "All") {
                          return showData(snapshot, index, myDate, myTime);
                        }
                      }

                      return SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  Widget showData(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      int index, String myDate, String myTime) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderStatus(
                orderId: snapshot.data!.docs[index]["orderId"],
                dateTime: "$myDate $myTime",
                number: snapshot.data!.docs[index]["number"],
              ),
            ));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            width: double.infinity,
            height: 55.h,
            color: Color.fromARGB(255, 251, 250, 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 0.1.sw,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      "${index + 1}.",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                ),
                Container(
                  width: 0.2.sw,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snapshot.data!.docs[index]["orderId"],
                      style: TextStyle(
                          color: AppComponent.Blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                Container(
                  width: 0.25.sw,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$myDate,\n$myTime",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                ),
                Container(
                  width: 0.25.sw,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.sp),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(AppComponent.downArrow)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.sp,
          )
        ],
      ),
    );
  }
}
