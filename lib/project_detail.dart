import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/design.dart';
import 'package:flutter_ipa_export/finance.dart';
import 'package:flutter_ipa_export/music.dart';
import 'package:flutter_ipa_export/projectforms/event_delivery.dart';
import 'package:flutter_ipa_export/projectforms/event_detail.dart';
import 'package:flutter_ipa_export/projectforms/post_event.dart';
import 'package:flutter_ipa_export/projectforms/pre_event.dart';
import 'package:flutter_ipa_export/reception.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ProjectDetailScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String date;
  final String time;
  final String count;
  final String title;
  final String id;

  const ProjectDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.date,
    required this.title,
    required this.id,
    required this.time,
    required this.count,
  });

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  var result;
  bool _isLoading = true;

  Future getData() async {
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/getdetail",
              data: {
                "project_id": widget.id,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            result = json.decode(response.toString());
            _isLoading = false;
          });
          return result;
        }
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
          )),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Transform.rotate(
              angle: pi,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: SvgPicture.asset(
                  "assets/general/homeBack.svg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Stack(
                  children: [
                    Positioned(
                      right: -10,
                      child: SvgPicture.asset(
                        "assets/general/projectDetail.svg",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      child: Image.asset(
                        "assets/general/groomBridePic.png",
                        scale: .95,
                      ),
                    ),
                    Positioned(
                      left: 5,
                      width: MediaQuery.of(context).size.width / 1.44,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "نام مشتری :",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 92, 92, 92)),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 17.0, top: 7),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 231, 231, 231),
                                        borderRadius: BorderRadius.circular(3)),
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "1234",
                                      style: TextStyle(fontSize: 13),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "شماره تماس :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                widget.phone,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 92, 92, 92)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "تاریخ مراسم :",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                Jalali.fromGregorian(Gregorian(
                                        int.parse(widget.date.split("-")[0]),
                                        int.parse(widget.date.split("-")[1]),
                                        int.parse(widget.date.split("-")[2])))
                                    .toJalaliDateTime()
                                    .split(" ")[0]
                                    .toString()
                                    .replaceAll(r'-', '/'),
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 92, 92, 92)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "نوع مراسم :",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    widget.title,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 92, 92, 92)),
                                  )
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 17.0, bottom: 0),
                              //   child: Container(
                              //       decoration: BoxDecoration(
                              //           color:
                              //               Color.fromARGB(255, 241, 241, 241),
                              //           borderRadius: BorderRadius.circular(3)),
                              //       padding: EdgeInsets.all(5),
                              //       child: Icon(
                              //         Icons.edit_outlined,
                              //         size: 14,
                              //       )),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _isLoading
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(40, 75, 42, 1),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PreEventFormScreen(
                                              id: widget.id,
                                              count: widget.count,
                                              date: widget.date,
                                              time: widget.time,
                                              title: widget.title,
                                              name: widget.name,
                                              phone: widget.phone,
                                              data: result['acquaintance'],
                                            )));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: result['acquaintance'] == null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/general/detail4.svg",
                                    height: 40,
                                    color: result['acquaintance'] != null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailFormScreen(
                                              id: widget.id,
                                              count: widget.count,
                                              date: widget.date,
                                              time: widget.time,
                                              title: widget.title,
                                              name: widget.name,
                                              phone: widget.phone,
                                              data: {
                                                'pre': result['pre_reception'],
                                                'reception':
                                                    result['reception'],
                                                'music': result['music'],
                                                'flower': result['flower'],
                                                'design': result['design'],
                                                'arrangement':
                                                    result['arrangement'],
                                              },
                                            )));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: result['pre_reception'] != null ||
                                            result['reception'] != null ||
                                            result['music'] != null ||
                                            result['flower'] != null ||
                                            result['design'] != null ||
                                            result['arrangement'] != null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/general/detail3.svg",
                                    height: 40,
                                    color: result['pre_reception'] != null ||
                                            result['reception'] != null ||
                                            result['music'] != null ||
                                            result['flower'] != null ||
                                            result['design'] != null ||
                                            result['arrangement'] != null
                                        ? Color.fromRGBO(40, 75, 42, 1)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventDeliveryFormScreen(
                                              id: widget.id,
                                              data: result['event_delivery'],
                                            )));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: result['event_delivery'] == null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/general/detail2.svg",
                                    height: 40,
                                    color: result['event_delivery'] != null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostEventFormScreen(
                                              id: widget.id,
                                              count: widget.count,
                                              date: widget.date,
                                              time: widget.time,
                                              title: widget.title,
                                              name: widget.name,
                                              phone: widget.phone,
                                              data: result['post_event'],
                                            )));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: result['post_event'] == null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/general/detail1.svg",
                                    height: 40,
                                    color: result['post_event'] != null
                                        ? Colors.white
                                        : Color.fromRGBO(40, 75, 42, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (role == "مدیر کل" ||
                                role == "مشاور پذیرایی" ||
                                role == "مشاور پذیرایی/مالی")
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReceptionScreen(
                                                id: widget.id,
                                                data: {
                                                  'pre':
                                                      result['pre_reception'],
                                                  'reception':
                                                      result['reception'],
                                                },
                                              )));
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 40,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                5.75,
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 202, 202, 202),
                                                blurRadius: 20)
                                          ]),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/general/reception.png",
                                              scale: .9,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "پذیرایی",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      40, 75, 42, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            if (role == "مدیر کل" || role == "مشاور موزیک")
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MusicScreen(
                                                id: widget.id,
                                                title: widget.title,
                                                data: {
                                                  'music': result['music'],
                                                  'schedule':
                                                      result['schedule'],
                                                  'performences':
                                                      result['performences'],
                                                },
                                              )));
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 40,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                5.75,
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 202, 202, 202),
                                                blurRadius: 20)
                                          ]),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/general/music.png",
                                              scale: .9,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "موسیقی و زمان بندی",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      40, 75, 42, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (role == "مدیر کل" ||
                                role == "مشاور مالی" ||
                                role == "مشاور پذیرایی/مالی")
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FinanceScreen(
                                                id: widget.id,
                                                data: {
                                                  "finance": result['finance'],
                                                  "payments":
                                                      result['payments'],
                                                },
                                              )));
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 60,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                5.75,
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 202, 202, 202),
                                                blurRadius: 20)
                                          ]),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/general/money.png",
                                              scale: .75,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "مالی و پرداختی",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      40, 75, 42, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 10,
                            ),
                            if (role == "مدیر کل" || role == "مشاور دیزاین")
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DesignScreen(
                                                id: widget.id,
                                                data: {
                                                  'flower': result['flower'],
                                                  'design': result['design'],
                                                  'arrangement':
                                                      result['arrangement'],
                                                },
                                              )));
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width / 2.25,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            blurRadius: 10)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 50,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                5.75,
                                        child: Container(
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 202, 202, 202),
                                                blurRadius: 20)
                                          ]),
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/general/flower.png",
                                              scale: .85,
                                            ),
                                            SizedBox(
                                              height: 0,
                                            ),
                                            Text(
                                              "دیزاین",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      40, 75, 42, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
            ]),
          ),
        ],
      ),
    );
  }
}
