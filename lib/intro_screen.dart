import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  final PageController _pagecontroller = PageController(initialPage: 0);
  bool isScreenThree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        controller: _pagecontroller,
        onPageChanged: (value) {
          if (value == 2) {
            setState(() {
              isScreenThree = true;
            });
          } else {
            setState(() {
              isScreenThree = false;
            });
          }
        },
        children: [
          intro(
              "asset/intro1.png",
              "Get unlimited access\nto high value courses",
              "Choose which courses will give the\nbreakthrough you’re looking for from our\nextensive courses library"),
          intro(
            "asset/intro2.png",
            "Learn from expert\ncoaches & mentors",
            "Learn from our expert mentors, coaches\n& industry experts who are passionate\nabout coaching their students & mentees",
          ),
          intro(
            "asset/intro3.png",
            "Become an expert\nyourself!",
            "Uplift your skills, stay sharp & get\nwinning edge. Get inside out to discoer\nyour path. Boost your journey",
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SmoothPageIndicator(
                controller: _pagecontroller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  spacing: 5.0,
                  radius: 5.0,
                  dotWidth: 10.0,
                  dotHeight: 5.0,
                  dotColor: Color.fromARGB(255, 205, 218, 222),
                  activeDotColor: Color.fromARGB(255, 18, 22, 32),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              isScreenThree == false
                  ? Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _pagecontroller.jumpToPage(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Color.fromARGB(151, 66, 84, 119))),
                              width: 152,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Skip",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 18, 22, 33)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print(_pagecontroller.page);
                              _pagecontroller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 18, 22, 33),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Color.fromARGB(151, 66, 84, 119))),
                              width: 152,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Next",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 18, 22, 33),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color.fromARGB(151, 66, 84, 119))),
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Get started",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    )
            ],
          )),
    ));
  }

  Widget intro(String img, String title, String discription) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      color: Color.fromARGB(255, 246, 249, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset(img),
          SizedBox(
            height: 50,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            discription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 153, 153, 153),
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
