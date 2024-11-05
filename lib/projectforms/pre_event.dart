import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class PreEventFormScreen extends StatefulWidget {
  final String id;
  final String name;
  final String date;
  final String time;
  final String title;
  final String count;
  final String phone;
  final dynamic data;

  const PreEventFormScreen(
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
  State<PreEventFormScreen> createState() => _PreEventFormScreenState();
}

class _PreEventFormScreenState extends State<PreEventFormScreen> {
  final TextEditingController _refrenceDate = TextEditingController();
  final TextEditingController _refrenceWay = TextEditingController();
  final TextEditingController _nextVisitDate = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  var result;

  Future insertData(AnimationController controller) async {
    String refDate = "";
    String nextDate = "";

    if (_refrenceDate.text.isNotEmpty && _refrenceDate.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_refrenceDate.text.split("/")[0]),
              int.parse(_refrenceDate.text.split("/")[1]),
              int.parse(_refrenceDate.text.split("/")[2])))
          .toDateTime();
      refDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    if (_nextVisitDate.text.isNotEmpty && _nextVisitDate.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_nextVisitDate.text.split("/")[0]),
              int.parse(_nextVisitDate.text.split("/")[1]),
              int.parse(_nextVisitDate.text.split("/")[2])))
          .toDateTime();
      nextDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertpreevent",
              data: {
                "project_id": widget.id,
                "full_name": widget.name,
                "phone_num": widget.phone.toString(),
                "event_date": widget.date,
                "event_time": widget.time,
                "event_title": widget.title,
                "reference_date": refDate,
                "guest_count": widget.count,
                "reference_title": _refrenceWay.text,
                "user_id": userId,
                "next_visit_date": nextDate,
                "detail": _detail.text,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            result = json.decode(response.toString());
          });
          controller.reset();
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
    if (widget.data != null) {
      _refrenceDate.text = widget.data["reference_date"] != null
          ? Jalali.fromGregorian(Gregorian(
                  int.parse(widget.data["reference_date"].split("-")[0]),
                  int.parse(widget.data["reference_date"].split("-")[1]),
                  int.parse(widget.data["reference_date"].split("-")[2])))
              .toJalaliDateTime()
              .split(" ")[0]
              .toString()
              .replaceAll(r'-', '/')
          : "";
      _refrenceWay.text = widget.data["reference_title"] ?? "";
      _nextVisitDate.text = widget.data["next_visit_date"] != null
          ? Jalali.fromGregorian(Gregorian(
                  int.parse(widget.data["next_visit_date"].split("-")[0]),
                  int.parse(widget.data["next_visit_date"].split("-")[1]),
                  int.parse(widget.data["next_visit_date"].split("-")[2])))
              .toJalaliDateTime()
              .split(" ")[0]
              .toString()
              .replaceAll(r'-', '/')
          : "";
      _detail.text = widget.data["detail"] ?? "";
    } else {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBarSuccess = SnackBar(
      content: Text('فرم با موفقیت ثبت شد.'),
    );
    SnackBar snackBarfail = SnackBar(
      content: Text('فرم ثبت نشد.'),
    );
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
          child: Column(
            children: [
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
                    "فرم آشنایی",
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
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تاریخ مراجعه :",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {
                            setState(() {});
                          },
                          controller: _refrenceDate,
                          decoration: const InputDecoration(
                              prefixIconColor:
                                  Color.fromARGB(255, 180, 180, 180),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 5,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              focusColor: Color.fromARGB(255, 180, 180, 180),
                              labelText: "",
                              suffixIcon: Icon(Icons.edit_outlined)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "از چه طریقی با ما آشنا شدید ؟",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {
                            setState(() {});
                          },
                          controller: _refrenceWay,
                          decoration: const InputDecoration(
                              prefixIconColor:
                                  Color.fromARGB(255, 180, 180, 180),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 5,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              focusColor: Color.fromARGB(255, 180, 180, 180),
                              labelText: "",
                              suffixIcon: Icon(Icons.edit_outlined)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "تاریخ مراجعه بعدی :",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {},
                          controller: _nextVisitDate,
                          decoration: const InputDecoration(
                              prefixIconColor:
                                  Color.fromARGB(255, 180, 180, 180),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 5,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              focusColor: Color.fromARGB(255, 180, 180, 180),
                              labelText: "",
                              suffixIcon: Icon(Icons.edit_outlined)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "پرزنتور :",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {},
                          initialValue: surName,
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 5,
                                  color: Colors.transparent), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.transparent), //<-- SEE HERE
                            ),
                            focusColor: Color.fromARGB(255, 180, 180, 180),
                            labelText: "",
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "توضیحات :",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {},
                          controller: _detail,
                          decoration: const InputDecoration(
                              prefixIconColor:
                                  Color.fromARGB(255, 180, 180, 180),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 5,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.transparent), //<-- SEE HERE
                              ),
                              focusColor: Color.fromARGB(255, 180, 180, 180),
                              labelText: "",
                              suffixIcon: Icon(Icons.edit_outlined)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProgressButton(
                            borderRadius: BorderRadius.circular(6),
                            strokeWidth: 3,
                            progressIndicatorSize: 20,
                            color: (_refrenceWay.text.isEmpty ||
                                    _refrenceDate.text.isEmpty)
                                ? Colors.grey
                                : Color.fromRGBO(40, 75, 42, 1),
                            onPressed: (con) {
                              if (_refrenceWay.text.isEmpty ||
                                  _refrenceDate.text.isEmpty) {
                              } else {
                                insertData(con).then((value) {
                                  if (result["message"] ==
                                      "فرم با موفقیت ثبت شد.") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBarSuccess);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBarfail);
                                  }
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "ثبت",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
