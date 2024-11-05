import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class EventDetailFormScreen extends StatefulWidget {
  final String id;
  final String name;
  final String date;
  final String time;
  final String title;
  final String count;
  final String phone;
  final dynamic data;

  const EventDetailFormScreen(
      {super.key,
      required this.id,
      required this.date,
      required this.title,
      required this.time,
      required this.count,
      required this.name,
      required this.phone,
      required this.data});

  @override
  State<EventDetailFormScreen> createState() => _EventDetailFormScreenState();
}

class _EventDetailFormScreenState extends State<EventDetailFormScreen> {
  bool oneCon = false;
  bool twoCon = false;
  bool threeCon = false;
  bool fourCon = false;
  bool fiveCon = false;
  bool sixCon = false;
  bool sevenCon = false;

  String fruit = "";
  String pastry = "";
  String juice = "";
  String chai = "";
  String cake = "";
  String bread = "";
  String bartender = "";
  String finger = "";
  String aragh = "";
  String chocklate = "";
  String nuts = "";
  String tase = "";
  String preDetail = "";

  String musicType = "";
  String perfomer = "";
  String atlieh = "";
  String musicDetail = "";

  String mealType = "";
  String baseMenu = "";
  String meatMenu = "";
  String veganMenu = "";
  String recptionDetail = "";

  String placeFlower = "";
  String placeFlowerDetail = "";
  String guestFlower = "";
  String guestFlowerDetail = "";
  String entranceFlower = "";
  String entranceFlowerDetail = "";
  String flowerDetail = "";

  String welcomeCard = "";
  String stand = "";
  String welcomeRose = "";
  String cakeTable = "";
  String gift = "";
  String notbook = "";
  String mohitCandle = "";
  String wedingCandle = "";
  String guestCandle = "";
  String designDetail = "";

  String reception = "";
  String receptionDetail = "";
  String church = "";
  String churchDetail = "";
  String guestChair = "";
  String guestChairDetail = "";
  String guestTable = "";
  String guestTableDetial = "";
  String hankerchief = "";
  String mive = "";
  String candle = "";
  String arrangDetail = "";

  @override
  void initState() {
    if (widget.data["pre"] != null) {
      fruit = widget.data["pre"]["fruits"] ?? "";
      pastry = widget.data["pre"]["pastry"] ?? "";
      juice = widget.data["pre"]["juice"] ?? "";
      chai = widget.data["pre"]["chai_cafe"] ?? "";
      cake = widget.data["pre"]["cake"] ?? "";
      bread = widget.data["pre"]["bread_cheese"] ?? "";
      finger = widget.data["pre"]["finger_food"] ?? "";
      bartender = widget.data["pre"]["bartender"] ?? "";
      aragh = widget.data["pre"]["aragh_faloodeh"] ?? "";
      chocklate = widget.data["pre"]["choclate"] ?? "";
      nuts = widget.data["pre"]["nuts"] ?? "";
      tase = widget.data["pre"]["taste_table"] ?? "";
      preDetail = widget.data["pre"]["detail"] ?? "";
    }
    if (widget.data["reception"] != null) {
      mealType = widget.data["reception"]["meal_type"] ?? "";
      baseMenu = widget.data["reception"]["base_menu"] ?? "";
      meatMenu = widget.data["reception"]["meat_menu"] ?? "";
      veganMenu = widget.data["reception"]["vegan_menu"] ?? "";
      recptionDetail = widget.data["reception"]["detail"] ?? "";
    }

    if (widget.data["music"] != null) {
      musicType = widget.data["music"]["items"] ?? "";
      perfomer = widget.data["music"]["performers"] ?? "";
      atlieh = widget.data["music"]["atelieh"] ?? "";
      musicDetail = widget.data["music"]["detail"] ?? "";
    }

    if (widget.data["flower"] != null) {
      placeFlower = widget.data["flower"]["natural_placement"] ?? "";
      placeFlowerDetail =
          widget.data["flower"]["natural_placement_detail"] ?? "";
      guestFlower = widget.data["flower"]["natural_guest_table"] ?? "";
      guestFlowerDetail =
          widget.data["flower"]["natural_guest_table_detail"] ?? "";
      entranceFlower = widget.data["flower"]["entrance"] ?? "";
      entranceFlowerDetail = widget.data["flower"]["entrance_detail"] ?? "";
      flowerDetail = widget.data["flower"]["detail"] ?? "";
    }
    if (widget.data["design"] != null) {
      welcomeCard = widget.data["design"]["welcome_card"] ?? "";
      stand = widget.data["design"]["table_stand"] ?? "";
      welcomeRose = widget.data["design"]["welcome_rose"] ?? "";
      cakeTable = widget.data["design"]["cake_table"] ?? "";
      gift = widget.data["design"]["gift"] ?? "";
      notbook = widget.data["design"]["notebook"] ?? "";
      mohitCandle = widget.data["design"]["setting_candle"] ?? "";
      wedingCandle = widget.data["design"]["wedding_candle"] ?? "";
      guestCandle = widget.data["design"]["guest_table_candle"] ?? "";
      designDetail = widget.data["design"]["detail"] ?? "";
    }
    if (widget.data["arrangement"] != null) {
      reception = widget.data["arrangement"]["reception"] ?? "";
      receptionDetail = widget.data["arrangement"]["reception_detail"] ?? "";
      church = widget.data["arrangement"]["church"] ?? "";
      churchDetail = widget.data["arrangement"]["church_detail"] ?? "";
      guestTable = widget.data["arrangement"]["guest_table"] ?? "";
      guestTableDetial = widget.data["arrangement"]["guest_table_detail"] ?? "";
      guestChair = widget.data["arrangement"]["guest_chair"] ?? "";
      guestChairDetail = widget.data["arrangement"]["guest_chair_detail"] ?? "";
      hankerchief = widget.data["arrangement"]["handkerchief"] ?? "";
      mive = widget.data["arrangement"]["fruit_bowl"] ?? "";
      candle = widget.data["arrangement"]["candle"] ?? "";
      arrangDetail = widget.data["arrangement"]["detail"] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.transparent,
                ),
                const Text(
                  "جزئیات مراسم",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(40, 75, 42, 1)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color.fromRGBO(40, 75, 42, 1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  oneCon = !oneCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: oneCon
                            ? Color.fromRGBO(40, 75, 42, 1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 202, 202, 202),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/general/reception.svg",
                        height: 5,
                        width: 5,
                        color: oneCon
                            ? Colors.white
                            : Color.fromRGBO(40, 75, 42, 1),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "پیش پذیرایی",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                oneCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (oneCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "4 مدل میوه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: fruit.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(fruit),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: fruit.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "3 مدل شیرینی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: pastry.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(pastry),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: pastry.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "آبمیوه طبیعی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: juice.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(juice),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: juice.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "چایی و نسکافه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: chai.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(chai),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: chai.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "کیک :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: cake.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(cake),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: cake.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "نان و پنیر :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: bread.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(bread),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: bread.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "بارتندر :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: bartender.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(bartender),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: bartender.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "فینگر فود :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: finger.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(finger),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: finger.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "عرقیات و فالوده :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: aragh.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(aragh),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: aragh.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "بار شکلات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: chocklate.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(chocklate),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: chocklate.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "آجیل :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: nuts.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(nuts),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: nuts.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "میزه مزه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: tase.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(tase),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: tase.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: preDetail.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(preDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: preDetail.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  twoCon = !twoCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: twoCon
                            ? Color.fromRGBO(40, 75, 42, 1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 202, 202, 202),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/general/music.svg",
                        height: 5,
                        width: 5,
                        color: twoCon
                            ? Colors.white
                            : Color.fromRGBO(40, 75, 42, 1),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "موزیک",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                twoCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (twoCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "نوع موسیقی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: musicType.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(musicType),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: musicType.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "اجرا کننده :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: perfomer.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(perfomer),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: perfomer.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "آتلیه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: atlieh.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(atlieh),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: atlieh.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: musicDetail.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(musicDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: musicDetail.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  threeCon = !threeCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        color: threeCon
                            ? Color.fromRGBO(40, 75, 42, 1)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 202, 202, 202),
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/general/foodAlt.svg",
                        height: 5,
                        width: 5,
                        color: threeCon
                            ? Colors.white
                            : Color.fromRGBO(40, 75, 42, 1),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "پذیرایی غذا",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                threeCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (threeCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "نوع وعده :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: mealType.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(mealType),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: mealType.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "منو پذیرایی بیس :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: baseMenu.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(baseMenu),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: baseMenu.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "منو غذاهای گوشتی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: meatMenu.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(meatMenu),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: meatMenu.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "منو غذاهای غیر گوشتی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: veganMenu.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(veganMenu),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: veganMenu.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    receptionDetail.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(receptionDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    receptionDetail.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  fourCon = !fourCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        oneCon = !oneCon;
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: fourCon
                              ? Color.fromRGBO(40, 75, 42, 1)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 202, 202, 202),
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/general/flower.svg",
                          height: 5,
                          width: 5,
                          color: fourCon
                              ? Colors.white
                              : Color.fromRGBO(40, 75, 42, 1),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "گل آرایی طبیعی",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                fourCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (fourCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "گل آرایی طبیعی جایگاه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: placeFlower.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(placeFlower),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: placeFlower.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات گل آرایی طبیعی جایگاه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    placeFlowerDetail.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(placeFlowerDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    placeFlowerDetail.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "گل آرایی طبیعی میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: guestFlower.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestFlower),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: guestFlower.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات گل آرایی طبیعی جایگاه :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    guestFlowerDetail.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestFlowerDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    guestFlowerDetail.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "گل آرایی ورودی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: entranceFlower.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(entranceFlower),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: entranceFlower.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات گل آرایی ورودی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: entranceFlowerDetail
                                                        .isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(entranceFlowerDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: entranceFlowerDetail
                                                        .isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: flowerDetail.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(flowerDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: flowerDetail.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  fiveCon = !fiveCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        oneCon = !oneCon;
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: fiveCon
                              ? Color.fromRGBO(40, 75, 42, 1)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 202, 202, 202),
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/general/design.svg",
                          height: 5,
                          width: 5,
                          color: fiveCon
                              ? Colors.white
                              : Color.fromRGBO(40, 75, 42, 1),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "دیزاین و تشریفات",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                fiveCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (fiveCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "کارت ولکام :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: welcomeCard.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(welcomeCard),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: welcomeCard.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "استند و میز ولکام :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: stand.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(stand),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: stand.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "رز ولکام :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: welcomeRose.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(welcomeRose),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: welcomeRose.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "دیزاین میز کیک :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: cakeTable.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(cakeTable),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: cakeTable.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "گیفت :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: gift.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(gift),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: gift.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "دفتر یادبود :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: notbook.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(notbook),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: notbook.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "شمع آرایی محیطی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: mohitCandle.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(mohitCandle),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: mohitCandle.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "شمع آرایی VIP سفره عقد :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: wedingCandle.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(wedingCandle),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: wedingCandle.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "شمع آرایی VIP میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: guestCandle.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestCandle),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: guestCandle.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: designDetail.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(designDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: designDetail.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  sixCon = !sixCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        oneCon = !oneCon;
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: sixCon
                              ? Color.fromRGBO(40, 75, 42, 1)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 202, 202, 202),
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/general/arrangment.svg",
                          height: 5,
                          width: 5,
                          color: sixCon
                              ? Colors.white
                              : Color.fromRGBO(40, 75, 42, 1),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "چیدمان",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                sixCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (sixCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "سرویس پذیرایی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: reception.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(reception),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: reception.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات سرویس پذیرایی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    receptionDetail.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(receptionDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    receptionDetail.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "چیدمان کلیسایی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: church.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(church),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: church.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات چیدمان کلیسایی :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: churchDetail.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(churchDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: churchDetail.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "صندلی میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: guestChair.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestChair),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: guestChair.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات صندلی میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    guestChairDetail.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestChairDetail),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    guestChairDetail.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "دیزاین میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: guestTable.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestTable),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: guestTable.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات دیزاین میز مهمان :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    guestTableDetial.isNotEmpty
                                                        ? Color.fromARGB(
                                                            255, 214, 214, 214)
                                                        : Color.fromARGB(
                                                            255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(guestTableDetial),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color:
                                                    guestTableDetial.isNotEmpty
                                                        ? Color.fromRGBO(
                                                            40, 75, 42, 1)
                                                        : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "رنگ دستمال سفره :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: hankerchief.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(hankerchief),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: hankerchief.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "مدل میوه خوری :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: mive.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(mive),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: mive.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "رنگ بار شمع سوخت :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: candle.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(candle),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: candle.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "توضیحات :",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128),
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: candle.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 214, 214, 214)
                                                    : Color.fromARGB(
                                                        255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 20.0, 8.0),
                                              child: Text(candle),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 13,
                                          right: 0,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 212, 212, 212),
                                                      blurRadius: 5)
                                                ],
                                                color: candle.isNotEmpty
                                                    ? Color.fromRGBO(
                                                        40, 75, 42, 1)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  sevenCon = !sevenCon;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        oneCon = !oneCon;
                      });
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: sevenCon
                              ? Color.fromRGBO(40, 75, 42, 1)
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 202, 202, 202),
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/general/detail.svg",
                          height: 5,
                          width: 5,
                          color: sevenCon
                              ? Colors.white
                              : Color.fromRGBO(40, 75, 42, 1),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.31,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "جزئیات دیگر",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                sevenCon
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                size: 25,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (sevenCon)
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.31,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 202, 202, 202),
                                      blurRadius: 20)
                                ],
                                borderRadius: BorderRadius.circular(6)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "نام و نام خانوادگی صاحب مراسم :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.31,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 235, 235),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 12.0, 8.0, 8.0),
                                      child: Text(widget.name),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "عنوان مراسم :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.25,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 8.0, 8.0),
                                              child: Text(widget.title),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "تعداد مهمان :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.25,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 8.0, 8.0),
                                              child: Text(widget.count),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "تاریخ مراسم :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.25,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 8.0, 8.0),
                                              child: Text(Jalali.fromGregorian(
                                                      Gregorian(
                                                          int.parse(widget.date
                                                              .split("-")[0]),
                                                          int.parse(widget.date
                                                              .split("-")[1]),
                                                          int.parse(widget.date
                                                              .split("-")[2])))
                                                  .toJalaliDateTime()
                                                  .split(" ")[0]
                                                  .toString()
                                                  .replaceAll(r'-', '/')),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ساعت مراسم :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.25,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 235, 235, 235),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 12.0, 8.0, 8.0),
                                              child: Text(widget.time),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ]),
        ),
      ),
    );
  }
}
