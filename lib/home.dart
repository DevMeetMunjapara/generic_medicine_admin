import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/appbar.dart';
import 'package:generic_medicine_admin/franchise.dart';
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
  List docList = <int>[];
  List loops = [];
  var mysnapshot;

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
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppComponent.Green),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "These orders have been confirm during Period date.",
                  style: TextStyle(
                      fontSize: 16.sp,
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
                              fontSize: 18.sp,
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
                                      color:
                                          Color.fromARGB(255, 226, 226, 226))),
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
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
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
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 251, 250, 250),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Color.fromARGB(255, 226, 226, 226))),
                          height: 35.h,
                          width: 110.w,
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: itemSelected,
                                isDense: true,
                                dropdownColor: Colors.white,
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                                items: const [
                                  DropdownMenuItem(
                                    value: "All",
                                    child: Text("All"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Pending",
                                    child: Text("Pending"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Approved",
                                    child: Text("Approved"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Delivery",
                                    child: Text("Delivery"),
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
                              ),
                            ),
                          ),
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                  width: 30.w,
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
                SizedBox(
                  width: 30.w,
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
              stream:
                  FirebaseFirestore.instance.collection("allOrder").snapshots(),
              builder: (context, snapshot) {
                docList.clear();
                loops.clear();
                for (var i = 0; i < snapshot.data!.docs.length; i++) {
                  docList.add(int.parse(snapshot.data!.docs[i].id));
                }
                docList.sort();
                print("------------$loops");
                for (var i = docList.length - 1; i >= 0; i--) {
                  loops.add(docList[i]);
                }

                print("------------$loops");

                if (snapshot.hasError) {
                  return Text("Error");
                }

                return ListView.builder(
                  itemCount: loops.length,
                  itemBuilder: (context, index) {
                    for (var i = 0; i < loops.length; i++) {
                      if (loops[index].toString() ==
                          snapshot.data!.docs[i].reference.id) {
                        String dateString = snapshot.data!.docs[i]["time"];
                        String date = snapshot.data!.docs[i]["time"];
                        DateTime dateTime = DateTime.parse(dateString);

                        String myDate =
                            DateFormat('dd/MM/yyyy').format(dateTime);
                        String myTime = DateFormat.jm().format(dateTime);

                        if (myDate == formattedDate && formattedDate != null) {
                          if (itemSelected == "Pending" &&
                              snapshot.data!.docs[i]["status"] == "1") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Approved" &&
                              snapshot.data!.docs[i]["status"] == "2") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Reject" &&
                              snapshot.data!.docs[i]["status"] == "3") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Delivery" &&
                              snapshot.data!.docs[i]["status"] == "4") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "All") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                        }
                        if (formattedDate == null) {
                          if (itemSelected == "Pending" &&
                              snapshot.data!.docs[i]["status"] == "1") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Approved" &&
                              snapshot.data!.docs[i]["status"] == "2") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Reject" &&
                              snapshot.data!.docs[i]["status"] == "3") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "Delivery" &&
                              snapshot.data!.docs[i]["status"] == "4") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                          if (itemSelected == "All") {
                            return showData(snapshot, i, myDate, myTime, index);
                          }
                        }
                      }
                    }

                    return SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 15.sp),
        height: 90.h,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Column(
                children: [
                  SvgPicture.asset(AppComponent.orderStatus),
                  Row(
                    children: [
                      Text(
                        "Order ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppComponent.Blue),
                      ),
                      Text(
                        "Status ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Color.fromARGB(108, 0, 56, 101)),
                      )
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Franchise()));
              },
              child: Column(
                children: [
                  SvgPicture.asset(AppComponent.franchise),
                  Row(
                    children: [
                      Text(
                        "Franchise Partner  ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppComponent.Green),
                      ),
                      Text(
                        "Status ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Color.fromARGB(141, 20, 46, 35)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showData(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      int i, String myDate, String myTime, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderStatus(
                orderId: snapshot.data!.docs[i]["orderId"],
                dateTime: "$myDate $myTime",
                number: snapshot.data!.docs[i]["number"],
                status: snapshot.data!.docs[i]["status"],
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 0.1.sw,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      "${loops.length - index}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  width: 0.2.sw,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snapshot.data!.docs[i]["orderId"],
                      style: TextStyle(
                          color: AppComponent.Blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Container(
                  //width: 0.35.sw,
                  height: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      myDate + "  " + myTime,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.sp,
          )
        ],
      ),
    );
  }
}
