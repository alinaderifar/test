import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';
import 'package:flutter_ipa_export/project_detail.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _search = TextEditingController();

  int catSellected = 4;
  var result;
  bool _isLoading = true;

  Future getData() async {
    Dio dio = Dio();
    setState(() {
      _isLoading = true;
      _search.text = '';
    });
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await dio.post(
          "https://pelakhaftapp.shop/api/getprojects",
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

  Future searchData() async {
    Dio dio = Dio();
    setState(() {
      _isLoading = true;
    });
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await dio.post(
          "https://pelakhaftapp.shop/api/searchproject",
          data: {'name': _search.text},
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
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBarfail = SnackBar(
      content: Text('فرم ثبت نشد.'),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.43,
              child: SvgPicture.asset(
                "assets/general/homeBack.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 231, 231, 231),
                            blurRadius: 10)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (_search.text.isNotEmpty) {
                              searchData();
                            }
                          },
                          child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(5.0),
                                      left: Radius.circular(0.0)),
                                  color: _search.text.isEmpty
                                      ? Color.fromRGBO(187, 187, 187, 1)
                                      : Color.fromRGBO(40, 75, 42, 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: _isLoading && _search.text.isNotEmpty
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : Icon(
                                        Icons.search,
                                        size: 23,
                                        color: _search.text.isEmpty
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.25,
                          height: 45,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _search,
                            decoration: InputDecoration(
                              prefixIconColor:
                                  Color.fromARGB(255, 180, 180, 180),
                              filled: true,
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    width: 5,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10.0),
                                    right: Radius.circular(0.0)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              focusColor: Color.fromARGB(255, 180, 180, 180),
                              labelText: "جستجوی مراسم ...",
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(
                                width: 1, color: Color.fromRGBO(91, 91, 91, 1)),
                          ),
                          child: Text(
                            "نزدیک ترین",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(91, 91, 91, 1)),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(91, 91, 91, 1))),
                          child: Text(
                            "پر هزینه ترین",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(91, 91, 91, 1)),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.checklist),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.sort),
                        SizedBox(
                          width: 19,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          catSellected = 1;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: catSellected == 1
                                ? Color.fromRGBO(40, 75, 42, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Column(children: [
                            Icon(
                              Icons.verified_outlined,
                              color: catSellected == 1
                                  ? Colors.white
                                  : Color.fromRGBO(40, 75, 42, 1),
                              size: 35,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "تایید شده",
                              style: TextStyle(
                                  color: catSellected == 1
                                      ? Colors.white
                                      : Color.fromRGBO(40, 75, 42, 1),
                                  fontSize: 16,
                                  fontWeight: catSellected == 1
                                      ? FontWeight.bold
                                      : FontWeight.w500),
                            )
                          ]),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          catSellected = 2;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: catSellected == 2
                                ? Color.fromRGBO(40, 75, 42, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                          child: Column(children: [
                            Icon(
                              Icons.timer_sharp,
                              color: catSellected == 2
                                  ? Colors.white
                                  : Color.fromRGBO(40, 75, 42, 1),
                              size: 35,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "مراسمات نزدیک",
                              style: TextStyle(
                                  color: catSellected == 2
                                      ? Colors.white
                                      : Color.fromRGBO(40, 75, 42, 1),
                                  fontSize: 12,
                                  fontWeight: catSellected == 2
                                      ? FontWeight.bold
                                      : FontWeight.w500),
                            )
                          ]),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          catSellected = 3;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: catSellected == 3
                                ? Color.fromRGBO(40, 75, 42, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                          child: Column(children: [
                            Icon(
                              Icons.restart_alt_rounded,
                              color: catSellected == 3
                                  ? Colors.white
                                  : Color.fromRGBO(40, 75, 42, 1),
                              size: 35,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "آخرین تغییرات",
                              style: TextStyle(
                                  color: catSellected == 3
                                      ? Colors.white
                                      : Color.fromRGBO(40, 75, 42, 1),
                                  fontSize: 12,
                                  fontWeight: catSellected == 3
                                      ? FontWeight.bold
                                      : FontWeight.w500),
                            )
                          ]),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          catSellected = 4;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: catSellected == 4
                                ? Color.fromRGBO(40, 75, 42, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 221, 221, 221),
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Column(children: [
                            Icon(
                              Icons.settings,
                              color: catSellected == 4
                                  ? Colors.white
                                  : Color.fromRGBO(40, 75, 42, 1),
                              size: 35,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "پیش فرض",
                              style: TextStyle(
                                  color: catSellected == 4
                                      ? Colors.white
                                      : Color.fromRGBO(40, 75, 42, 1),
                                  fontSize: 16,
                                  fontWeight: catSellected == 4
                                      ? FontWeight.bold
                                      : FontWeight.w500),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 212, 212, 212),
                        highlightColor: Color.fromARGB(255, 194, 194, 194),
                        child: Column(
                          children: List<Widget>.generate(
                              5,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        height: 80,
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
                    : result.isNotEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: result.length,
                                reverse: false,
                                itemBuilder: (BuildContext context, int index) {
                                  int progress = 0;
                                  int music = 0;
                                  int design = 0;
                                  int financeReception = 0;
                                  if (result[index.toString()]
                                          ['post_event_form_id'] !=
                                      null) {
                                    progress += 1;
                                  }
                                  if (result[index.toString()]
                                          ['acquaintance_form_id'] !=
                                      null) {
                                    progress += 1;
                                  }
                                  if (result[index.toString()]
                                          ['event_delivery_form_id'] !=
                                      null) {
                                    progress += 1;
                                  }
                                  if (result[index.toString()]
                                          ['pre_reception_form_id'] !=
                                      null) {
                                    progress += 1;
                                    financeReception += 1;
                                  }
                                  if (result[index.toString()]
                                          ['music_form_id'] !=
                                      null) {
                                    progress += 1;
                                    music += 1;
                                  }
                                  if (result[index.toString()]
                                          ['flower_form_id'] !=
                                      null) {
                                    progress += 1;
                                    design += 1;
                                  }
                                  if (result[index.toString()]
                                          ['design_form_id'] !=
                                      null) {
                                    progress += 1;
                                    design += 1;
                                  }
                                  if (result[index.toString()]
                                          ['arrangement_form_id'] !=
                                      null) {
                                    progress += 1;
                                    design += 1;
                                  }
                                  if (result[index.toString()]
                                          ['reception_form_id'] !=
                                      null) {
                                    progress += 1;
                                    financeReception += 1;
                                  }
                                  if (result[index.toString()]
                                          ['finance_form_id'] !=
                                      null) {
                                    progress += 1;
                                    financeReception += 1;
                                  }
                                  if (result[index.toString()]
                                          ['schedule_form_id'] !=
                                      null) {
                                    progress += 1;
                                    music += 1;
                                  }
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 40.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProjectDetailScreen(
                                                      title: result[index
                                                          .toString()]['title'],
                                                      phone: result[
                                                              index.toString()]
                                                          ['owner_phone'],
                                                      name: result[
                                                              index.toString()]
                                                          ['owner_name'],
                                                      id: result[index
                                                              .toString()]['id']
                                                          .toString(),
                                                      date: result[
                                                              index.toString()]
                                                          ['event_date'],
                                                      count: result[index
                                                                  .toString()]
                                                              ['guest_count']
                                                          .toString(),
                                                      time: result[
                                                              index.toString()]
                                                          ['event_time'],
                                                    )));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                decoration:
                                                    BoxDecoration(boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 235, 235, 235),
                                                      blurRadius: 10)
                                                ]),
                                                child: SvgPicture.asset(
                                                    "assets/general/Rectangle.svg",
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.15,
                                                    semanticsLabel:
                                                        'Acme Logo'),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7,
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.ltr,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      1.6,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: .1)),
                                                  child: LinearProgressBar(
                                                    maxSteps: 11,
                                                    minHeight: 7,
                                                    progressType: LinearProgressBar
                                                        .progressTypeLinear, // Use Linear progress
                                                    currentStep: progress,
                                                    progressColor:
                                                        Color.fromRGBO(
                                                            116, 255, 124, 1),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              top: 15,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              231,
                                                              231,
                                                              231),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text(
                                                        result[index.toString()]
                                                                ["id"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    result[index.toString()]
                                                        ["owner_name"],
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              top: 15,
                                              left: 0,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Text(
                                                      Jalali.fromGregorian(Gregorian(
                                                              int.parse(result[index.toString()]["event_date"]
                                                                  .split(
                                                                      "-")[0]),
                                                              int.parse(result[index.toString()]
                                                                      [
                                                                      "event_date"]
                                                                  .split(
                                                                      "-")[1]),
                                                              int.parse(result[index.toString()]
                                                                      ["event_date"]
                                                                  .split("-")[2])))
                                                          .toJalaliDateTime()
                                                          .split(" ")[0]
                                                          .toString()
                                                          .replaceAll(r'-', '/'),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    result[index.toString()]
                                                        ["title"],
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255, 90, 90, 90)),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              40, 75, 42, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text(
                                                        "${11 - progress}+",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.8,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              255,
                                                              239,
                                                              239,
                                                              0.5),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20))),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            (3.8 *
                                                                3 /
                                                                (financeReception ==
                                                                        0
                                                                    ? .75
                                                                    : financeReception)),
                                                        height: 22,
                                                        child: Center(
                                                          child: Text(
                                                            "$financeReception/3",
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color
                                                                    .fromRGBO(
                                                                        255,
                                                                        235,
                                                                        235,
                                                                        1),
                                                            borderRadius: BorderRadius.only(
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        financeReception ==
                                                                                3
                                                                            ? 30
                                                                            : 0))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.8,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            224, 251, 226, 0.5),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            (3.8 *
                                                                3 /
                                                                (design == 0
                                                                    ? .75
                                                                    : design)),
                                                        height: 22,
                                                        child: Center(
                                                          child: Text(
                                                            "$design/3",
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              224, 251, 226, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.8,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              255,
                                                              233,
                                                              208,
                                                              0.5),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          30))),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            (3.8 *
                                                                1.5 /
                                                                (music == 0
                                                                    ? .5
                                                                    : music)),
                                                        height: 22,
                                                        child: Center(
                                                          child: Text(
                                                            "$music/2",
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    233,
                                                                    208,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            30))),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Column(
                            children: [
                              Text(
                                "نتیجه ای یافت نشد.",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ProgressButton(
                                      borderRadius: BorderRadius.circular(6),
                                      strokeWidth: 3,
                                      progressIndicatorSize: 20,
                                      color: Color.fromRGBO(40, 75, 42, 1),
                                      onPressed: (con) {
                                        if (_isLoading) {
                                          con.forward();
                                        } else {
                                          con.reset();
                                        }
                                        getData();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "نمایش همه مراسم ها",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
