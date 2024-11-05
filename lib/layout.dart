import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ipa_export/calender.dart';

import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/home.dart';
import 'package:flutter_ipa_export/insert_project.dart';
import 'package:flutter_ipa_export/profile.dart';
import 'package:flutter_ipa_export/report.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  void bottomTapped(int index) {
    setState(() {
      homeIndex = index;
      pageController.jumpToPage(
        index,
      );
    });
  }

  void pageChanged(int index) {
    setState(() {
      homeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (homeIndex == 0) {
          return true;
        } else {
          setState(() {
            homeIndex = 0;
            pageController.jumpTo(0);
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: homeIndex != 2
            ? AppBar(
                surfaceTintColor: const Color.fromARGB(255, 165, 165, 165),
                elevation: 3,
                backgroundColor: Colors.white,
                title: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/general/logoAlt.png",
                        scale: .9,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: Color.fromRGBO(40, 75, 42, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  surName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  role,
                                  style: TextStyle(
                                      color: Color.fromRGBO(40, 75, 42, 1),
                                      fontSize: 10),
                                )
                              ],
                            )
                          ],
                        ),
                        Opacity(
                          opacity: 0,
                          child: Image.asset(
                            "assets/general/logoAlt.png",
                            scale: .9,
                          ),
                        ),
                        Row(
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [.2, 1],
                                colors: [
                                  Color.fromRGBO(0, 255, 15, 1),
                                  Color.fromRGBO(40, 75, 42, 1),
                                ],
                              ).createShader(bounds),
                              child: Icon(
                                Icons.notifications,
                                color: Color.fromRGBO(0, 255, 15, 1),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [.2, 1],
                                colors: [
                                  Color.fromRGBO(0, 255, 15, 1),
                                  Color.fromRGBO(40, 75, 42, 1),
                                ],
                              ).createShader(bounds),
                              child: Icon(
                                Icons.help_outline_sharp,
                                color: Color.fromRGBO(0, 255, 15, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
            : null,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          iconPadding: 8,
          index: homeIndex,
          color: Colors.white,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color.fromRGBO(40, 75, 42, 1),
          items: [
            CurvedNavigationBarItem(
              label: "خانه",
              labelStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight:
                      homeIndex == 0 ? FontWeight.w900 : FontWeight.normal),
              child: Icon(
                size: 35,
                homeIndex == 0 ? Icons.home : Icons.home,
                color: homeIndex == 0
                    ? Colors.white
                    : Color.fromRGBO(40, 75, 42, 1),
              ),
            ),
            CurvedNavigationBarItem(
                label: "گزارشات",
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight:
                        homeIndex == 1 ? FontWeight.w900 : FontWeight.normal),
                child: homeIndex == 1
                    ? SvgPicture.asset(
                        "assets/general/reportIconAlt.svg",
                        width: 38,
                      )
                    : SvgPicture.asset(
                        "assets/general/reportIcon.svg",
                        width: 38,
                      )),
            CurvedNavigationBarItem(
                label: "افزودن",
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight:
                        homeIndex == 2 ? FontWeight.w900 : FontWeight.normal),
                child: homeIndex == 2
                    ? Icon(size: 35, Icons.add, color: Colors.white)
                    : SvgPicture.asset(
                        "assets/general/addIcon.svg",
                        width: 38,
                      )),
            CurvedNavigationBarItem(
                label: "تقویم",
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight:
                        homeIndex == 3 ? FontWeight.w900 : FontWeight.normal),
                child: homeIndex == 3
                    ? SvgPicture.asset(
                        "assets/general/calIconIcon.svg",
                        width: 38,
                      )
                    : SvgPicture.asset(
                        "assets/general/calIcon.svg",
                        width: 38,
                      )),
            CurvedNavigationBarItem(
              label: "پروفایل",
              labelStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight:
                      homeIndex == 4 ? FontWeight.w900 : FontWeight.normal),
              child: Icon(
                  homeIndex == 4 ? Icons.account_circle : Icons.account_circle,
                  size: 35,
                  color: homeIndex == 4
                      ? Colors.white
                      : Color.fromRGBO(40, 75, 42, 1)),
            )
          ],
          onTap: (index) {
            bottomTapped(index);
          },
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            pageChanged(index);
          },
          controller: pageController,
          children: [
            HomeScreen(),
            ReportScreen(),
            InsertProjectScreen(),
            CalenderScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
