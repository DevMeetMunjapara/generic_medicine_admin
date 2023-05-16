import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:generic_medicine_admin/CustomWidget/AppComponent.dart';
import 'package:generic_medicine_admin/CustomWidget/appbar.dart';
import 'package:generic_medicine_admin/franchisePartner.dart';
import 'package:generic_medicine_admin/home.dart';
import 'package:intl/intl.dart';

class Franchise extends StatefulWidget {
  const Franchise({super.key});

  @override
  State<Franchise> createState() => _FranchiseState();
}

class _FranchiseState extends State<Franchise> {
  var db = FirebaseFirestore.instance.collection("allpartner");
  String itemSelected = "All";
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    print("----------$db");

    return Scaffold(
      appBar: MyAppBar().myappwithLogo(context),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Franchise Partner Detailed",
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppComponent.Green),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Franchise Partner Applied Reoprts",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Color.fromARGB(255, 117, 122, 120)),
                ),
                SizedBox(
                  height: 15.h,
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
                                    value: "Not Read",
                                    child: Text("Not Read"),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    itemSelected = value!;
                                    print(itemSelected);
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
          SizedBox(
            height: 20.h,
          ),
          Container(
              padding: EdgeInsets.all(20.sp),
              width: double.infinity,
              height: 0.58.sh,
              child: StreamBuilder(
                  stream: db.snapshots(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                        itemCount: snapshot.data!.size,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.sp,
                            mainAxisSpacing: 10.sp),
                        itemBuilder: (context, index) {
                          String dateString =
                              snapshot.data!.docs[index]["date"];
                          String date = snapshot.data!.docs[index]["date"];
                          DateTime dateTime = DateTime.parse(dateString);
                          String myDate =
                              DateFormat('dd/MM/yyyy').format(dateTime);
                          String myTime = DateFormat.jm().format(dateTime);
                          if (myDate == formattedDate &&
                              formattedDate != null) {
                            if (itemSelected == "All") {
                              return mybox(snapshot, myDate, myTime, index);
                            }

                            if (itemSelected == "Not Read" &&
                                snapshot.data!.docs[index]["readMass"] == "0") {
                              return mybox(snapshot, myDate, myTime, index);
                            }
                          }

                          if (formattedDate == null) {
                            if (itemSelected == "All") {
                              return mybox(snapshot, myDate, myTime, index);
                            }

                            if (itemSelected == "Not Read" &&
                                snapshot.data!.docs[index]["readMass"] == "0") {
                              return mybox(snapshot, myDate, myTime, index);
                            }
                          }

                          return SizedBox.shrink();
                        });
                  }))
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

  Widget mybox(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      String myDate, String myTime, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FranchisePartner(
                orderId: snapshot.data!.docs[index].id,
                dateTime: myDate + " " + myTime,
                name: snapshot.data!.docs[index]["name"],
                number: snapshot.data!.docs[index]["number"],
                email: snapshot.data!.docs[index]["email"],
                address: snapshot.data!.docs[index]["address"] +
                    snapshot.data!.docs[index]["city"],
                readMass: snapshot.data!.docs[index]["readMass"],
              ),
            ));
      },
      child: Material(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppComponent.user,
                height: 40.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                snapshot.data!.docs[index]["name"],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppComponent.Blue,
                    fontSize: 18.sp),
              ),
              Text(
                snapshot.data!.docs[index]["email"],
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "$myDate| $myTime",
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
