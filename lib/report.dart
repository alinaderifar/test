import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/Stats.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:shimmer/shimmer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _fromDate = TextEditingController();
  final TextEditingController _toDate = TextEditingController();
  final TextEditingController _fromNum = TextEditingController();
  final TextEditingController _toNum = TextEditingController();
  final TextEditingController _fromAmount = TextEditingController();
  final TextEditingController _toAmount = TextEditingController();

  bool oneCon = false;
  bool twoCon = false;
  bool threeCon = false;
  bool fourCon = false;
  bool fiveCon = false;
  bool sixCon = false;
  bool sevenCon = false;

  bool fruit = false;
  bool pastry = false;
  bool juice = false;
  bool chai = false;
  bool cake = false;
  bool bread = false;
  bool bartender = false;
  bool finger = false;
  bool aragh = false;
  bool chocklate = false;
  bool nuts = false;
  bool tase = false;

  String mealType = "";
  bool baseMenu = false;
  bool meatMenu = false;
  bool veganMenu = false;
  bool recptionDetail = false;

  bool placeFlower = false;
  bool placeFlowerDetail = false;
  bool guestFlower = false;
  bool guestFlowerDetail = false;
  bool entranceFlower = false;
  bool entranceFlowerDetail = false;
  bool flowerDetail = false;

  bool welcomeCard = false;
  bool stand = false;
  bool welcomeRose = false;
  bool cakeTable = false;
  bool gift = false;
  bool notbook = false;
  bool mohitCandle = false;
  bool wedingCandle = false;
  bool guestCandle = false;
  bool designDetail = false;

  bool reception = false;
  bool receptionDetail = false;
  bool church = false;
  bool churchDetail = false;
  bool guestChair = false;
  bool guestChairDetail = false;
  bool guestTable = false;
  bool guestTableDetial = false;
  bool hankerchief = false;
  bool mive = false;
  bool candle = false;
  bool arrangDetail = false;

  late Map<String, bool> filters = {
    "fruits": fruit,
    "pastry": pastry,
    "juice": juice,
    "chai_cafe": chai,
    "cake": cake,
    "bread_cheese": bread,
    "finger_food": finger,
    "bartender": bartender,
    "aragh_faloodeh": aragh,
    "choclate": chocklate,
    "nuts": nuts,
    "taste_table": tase,
    "meal_type": mealType.isNotEmpty,
    "base_menu": baseMenu,
    "meat_menu": meatMenu,
    "vegan_menu": veganMenu,
    "welcome_card": welcomeCard,
    "table_stand": stand,
    "welcome_rose": welcomeRose,
    "cake_table": cakeTable,
    "gift": gift,
    "notebook": notbook,
    "setting_candle": mohitCandle,
    "wedding_candle": wedingCandle,
    "guest_table_candle": guestCandle,
  };

  var result;
  bool _isLoading = true;

  int filtersCount = 0;
  int count = 0;

  Future getData() async {
    Dio dio = Dio();

    String fromDate = "";
    String toDate = "";

    if (_fromDate.text.isNotEmpty && _fromDate.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_fromDate.text.split("/")[0]),
              int.parse(_fromDate.text.split("/")[1]),
              int.parse(_fromDate.text.split("/")[2])))
          .toDateTime();
      fromDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    if (_fromDate.text.isNotEmpty && _fromDate.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_fromDate.text.split("/")[0]),
              int.parse(_fromDate.text.split("/")[1]),
              int.parse(_fromDate.text.split("/")[2])))
          .toDateTime();
      toDate = "${gore.year}-${gore.month}-${gore.day}";
    }
    setState(() {
      _isLoading = true;
    });
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/reportproject",
              data: {
                "filters": filters,
                "title": _title.text,
                "fromDate": fromDate,
                "toDate": toDate,
                "fromNum": _fromNum,
                "toNum": _toNum,
                "fromAmount": _fromAmount,
                "toAmount": _toAmount,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            result = json.decode(response.toString())["projects"];
            _isLoading = false;
          });
          print(json.decode(response.toString())["projects"].length);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                "گزارشات",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(40, 75, 42, 1)),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  scrollable: true,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        12.0,
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  content: Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.05,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          40, 75, 42, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Icon(
                                                      Icons.close_outlined,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "مراسم",
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    40, 75, 42, 1)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "نوع مراسم :",
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
                                                    1.5,
                                                height: 80,
                                                child: TextFormField(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  onChanged: (e) {},
                                                  controller: _title,
                                                  decoration:
                                                      const InputDecoration(
                                                          prefixIconColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  180,
                                                                  180,
                                                                  180),
                                                          filled: true,
                                                          fillColor: Color.fromRGBO(
                                                              243, 243, 243, 1),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            borderSide: BorderSide(
                                                                width: 5,
                                                                color: Colors
                                                                    .transparent), //<-- SEE HERE
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            borderSide: BorderSide(
                                                                width: 2,
                                                                color: Colors
                                                                    .transparent), //<-- SEE HERE
                                                          ),
                                                          focusColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  180,
                                                                  180,
                                                                  180),
                                                          labelText: "",
                                                          suffixIcon: Icon(Icons
                                                              .edit_outlined)),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "از تاریخ :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _fromDate,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "تا تاریخ :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _toDate,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "از شماره قرارداد :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _fromNum,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "تا شماره قرارداد :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _toNum,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "از مبلغ قرارداد :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _fromAmount,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "تا مبلغ قرارداد :",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.1,
                                                    height: 80,
                                                    child: TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      onChanged: (e) {},
                                                      controller: _toNum,
                                                      decoration:
                                                          const InputDecoration(
                                                              prefixIconColor:
                                                                  Color.fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              filled: true,
                                                              fillColor:
                                                                  Color.fromRGBO(
                                                                      243,
                                                                      243,
                                                                      243,
                                                                      1),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 5,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0)),
                                                                borderSide: BorderSide(
                                                                    width: 2,
                                                                    color: Colors
                                                                        .transparent), //<-- SEE HERE
                                                              ),
                                                              focusColor: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      180,
                                                                      180,
                                                                      180),
                                                              labelText: "",
                                                              suffixIcon: Icon(Icons
                                                                  .edit_outlined)),
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                    width: 80,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            40, 75, 42, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: Center(
                                                      child: Text(
                                                        "ثبت تغییرات",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 92, 92, 92)),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "مراسم",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 53, 53, 53)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                      scrollable: true,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            12.0,
                                          ),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(
                                        top: 10.0,
                                      ),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.05,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              40, 75, 42, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1.0),
                                                        child: Icon(
                                                          Icons.close_outlined,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                "خدمات",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        40, 75, 42, 1)),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        oneCon = !oneCon;
                                                      });
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.31,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        202,
                                                                        202,
                                                                        202),
                                                                blurRadius: 5)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "پیش پذیرایی",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          112,
                                                                          112,
                                                                          112)),
                                                            ),
                                                            Icon(
                                                              oneCon
                                                                  ? Icons
                                                                      .keyboard_arrow_up_rounded
                                                                  : Icons
                                                                      .keyboard_arrow_down_rounded,
                                                              size: 25,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      40,
                                                                      75,
                                                                      42,
                                                                      1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (oneCon)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.31,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          202,
                                                                          202,
                                                                          202),
                                                                      blurRadius:
                                                                          20)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              fruit,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              fruit = !fruit;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "میوه",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              cake,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              cake = !cake;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "کیک",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              chocklate,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              chocklate = !chocklate;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "شکلات",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              pastry,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              pastry = !pastry;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "شیرینی",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              bread,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              bread = !bread;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "نان و پنیر",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              nuts,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              nuts = !nuts;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "آجیل",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              juice,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              juice = !juice;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "آبمیوه",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              bartender,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              bartender = !bartender;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "بارتندر",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              finger,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              finger = !finger;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "فینگرفود",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              chai,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              chai = !chai;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "چای",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              aragh,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              aragh = !aragh;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "عرقیات",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              tase,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              tase = !tase;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "میزمیزه",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        twoCon = !twoCon;
                                                      });
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.31,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        202,
                                                                        202,
                                                                        202),
                                                                blurRadius: 5)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "پذیرایی",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          112,
                                                                          112,
                                                                          112)),
                                                            ),
                                                            Icon(
                                                              twoCon
                                                                  ? Icons
                                                                      .keyboard_arrow_up_rounded
                                                                  : Icons
                                                                      .keyboard_arrow_down_rounded,
                                                              size: 25,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      40,
                                                                      75,
                                                                      42,
                                                                      1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (twoCon)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.31,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          202,
                                                                          202,
                                                                          202),
                                                                      blurRadius:
                                                                          20)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              mealType == "ناهار",
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              mealType = "ناهار";
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "ناهار",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              mealType == "شام",
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              mealType = "شام";
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "شام",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              mealType == "صبحانه",
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              mealType = "صبحانه";
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "صبحانه",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              meatMenu,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              meatMenu = !meatMenu;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "منو گوشتی",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              veganMenu,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              veganMenu = !veganMenu;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "منوغیر گوشتی",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        threeCon = !threeCon;
                                                      });
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.31,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        202,
                                                                        202,
                                                                        202),
                                                                blurRadius: 5)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "دیزاین و تشریفات",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          112,
                                                                          112,
                                                                          112)),
                                                            ),
                                                            Icon(
                                                              threeCon
                                                                  ? Icons
                                                                      .keyboard_arrow_up_rounded
                                                                  : Icons
                                                                      .keyboard_arrow_down_rounded,
                                                              size: 25,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      40,
                                                                      75,
                                                                      42,
                                                                      1),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (threeCon)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.31,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          202,
                                                                          202,
                                                                          202),
                                                                      blurRadius:
                                                                          20)
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              welcomeCard,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              welcomeCard = !welcomeCard;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "کارت ولکام ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              stand,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              stand = !stand;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "استند و میز ولکام",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              welcomeRose,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              welcomeRose = !welcomeRose;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "رز ولکام ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              cakeTable,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              cakeTable = !cakeTable;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "دیزاین میز کیک ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              gift,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              gift = !gift;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "گیفت",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              notbook,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              notbook = !notbook;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "دفتر یادبود ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                13),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              mohitCandle,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              mohitCandle = !mohitCandle;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "شمع آرایی محیطی ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ], borderRadius: BorderRadius.circular(20)),
                                                                        child:
                                                                            Checkbox(
                                                                          value:
                                                                              wedingCandle,
                                                                          onChanged:
                                                                              (e) {
                                                                            setState(() {
                                                                              wedingCandle = !wedingCandle;
                                                                            });
                                                                          },
                                                                          activeColor: Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                          side:
                                                                              BorderSide(color: const Color.fromARGB(255, 192, 192, 192)),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "شمع آرایی VIP سفره عقد ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 30,
                                                                    height: 30,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                245,
                                                                                245,
                                                                                245),
                                                                            blurRadius:
                                                                                20,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        Checkbox(
                                                                      value:
                                                                          guestCandle,
                                                                      onChanged:
                                                                          (e) {
                                                                        setState(
                                                                            () {
                                                                          guestCandle =
                                                                              !guestCandle;
                                                                        });
                                                                      },
                                                                      activeColor:
                                                                          Color.fromRGBO(
                                                                              40,
                                                                              75,
                                                                              42,
                                                                              1),
                                                                      side: BorderSide(
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              255,
                                                                              192,
                                                                              192,
                                                                              192)),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "شمع آرایی VIP میز مهمان ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        width: 80,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    40,
                                                                    75,
                                                                    42,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                        child: Center(
                                                          child: Text(
                                                            "ثبت تغییرات",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                });
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 92, 92, 92)),
                                borderRadius: BorderRadius.circular(4)),
                            height: 40,
                            width: 80,
                            child: Center(
                              child: Text(
                                "خدمات",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 71, 71, 71)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        // TextButton(
                        //   style: TextButton.styleFrom(
                        //       backgroundColor: Colors.transparent,
                        //       side: BorderSide(
                        //           width: 1,
                        //           color: Color.fromARGB(255, 92, 92, 92))),
                        //   child: Text(
                        //     "تاریخ",
                        //     style: TextStyle(
                        //         fontSize: 15,
                        //         fontWeight: FontWeight.w500,
                        //         color: Color.fromARGB(255, 66, 66, 66)),
                        //   ),
                        //   onPressed: () {},
                        // ),
                        // SizedBox(
                        //   width: 30,
                        // ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StatsScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(40, 75, 42, 1),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 8.0),
                              child: Text(
                                "آمار",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 219, 219, 219)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text.rich(
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "$count ",
                                style: TextStyle(
                                    color: Color.fromRGBO(40, 75, 42, 1),
                                    fontWeight: FontWeight.w900)),
                            TextSpan(
                                text: "مورد پیدا شد.",
                                style: TextStyle(
                                  color: Color.fromRGBO(75, 75, 75, 1),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 75,
                          child: Stack(
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13.0, vertical: 8.0),
                                      child: Text(
                                        "فیلترها",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 92, 92, 92),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  left: 0,
                                  top: 8,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(40, 75, 42, 1),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text(
                                        "$filtersCount",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 219, 219, 219)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _isLoading
                      ? Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 236, 236, 236),
                          highlightColor: Color.fromARGB(255, 223, 222, 222),
                          child: Column(
                            children: List<Widget>.generate(
                                5,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          height: 60,
                                          child: Stack(
                                            children: [
                                              Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.15,
                                                  height: 90,
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 221, 221, 221),
                                                        blurRadius: 10)
                                                  ]),
                                                  child: Text("data"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                          ),
                        )
                      : ListView.builder(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          reverse: false,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.28,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          243, 243, 243, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  child: Center(
                                                    child: Text(
                                                      "1252",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "محمد رضا رحیمی",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "1403/05/10",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "عروسی",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "8.5",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                ),
              ),
              SizedBox(height: 90)
            ],
          ),
        ),
      ),
    );
  }
}
