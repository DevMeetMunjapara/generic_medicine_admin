import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 42, left: 40),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      width: 320,
                      height: 269,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    child: Container(
                      height: 26,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          "Most popular",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Container(
                      width: 280,
                      height: 240,
                      // color: Colors.amber,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset("asset/book.png"),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Premium Plan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 216, 216, 216),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 18,
                                width: 3,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "27 courses",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Image.asset("asset/tickmark.png")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "₹ 1,999 / Month",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Pay monthly, cancel any time",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 153, 153, 153),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 108,
                                height: 30,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(100, 7, 72, 91)),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "View courses",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("asset/arrow-right.png")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Row(
                              children: List.generate(
                                  500 ~/ 10,
                                  (index) => Expanded(
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : Colors.grey,
                                          height: 2,
                                        ),
                                      )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 1,999.00",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax 18.0%",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 153, 153, 153),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 999.00",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7),
                            child: Row(
                              children: List.generate(
                                  500 ~/ 10,
                                  (index) => Expanded(
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : Colors.grey,
                                          height: 2,
                                        ),
                                      )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Payment",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹ 2,998.00",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                width: 320,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color.fromARGB(20, 0, 0, 0))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "asset/book.png",
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Dr. Adhiya Courses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 216, 216, 216),
                              borderRadius: BorderRadius.circular(10)),
                          height: 18,
                          width: 3,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "17 courses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 240, 242, 242),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹ 1,999 / Month",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pay monthly, cancel any time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 153, 153, 153),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 108,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(100, 7, 72, 91)),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View courses",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Image.asset("asset/arrow-right.png")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                width: 320,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color.fromARGB(20, 0, 0, 0))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "asset/book.png",
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "YSR Courses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 216, 216, 216),
                              borderRadius: BorderRadius.circular(10)),
                          height: 18,
                          width: 3,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "8 courses",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromARGB(255, 240, 242, 242),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "₹ 1,999 / Month",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pay monthly, cancel any time",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 153, 153, 153),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 108,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(100, 7, 72, 91)),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View courses",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Image.asset("asset/arrow-right.png")
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 52,
                width: 320,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Proceed",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Start 15 day free trial",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
