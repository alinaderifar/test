import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';

class PostEventFormScreen extends StatefulWidget {
  final String id;
  final String name;
  final String date;
  final String time;
  final String title;
  final String count;
  final String phone;
  final dynamic data;

  const PostEventFormScreen(
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
  State<PostEventFormScreen> createState() => _PostEventFormScreenState();
}

class _PostEventFormScreenState extends State<PostEventFormScreen> {
  final TextEditingController _personel = TextEditingController();
  final TextEditingController _music = TextEditingController();
  final TextEditingController _flower = TextEditingController();
  final TextEditingController _food = TextEditingController();
  final TextEditingController _rating = TextEditingController();
  final TextEditingController _suggestions = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  var result;

  Future insertData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertpostevent",
              data: {
                "project_id": widget.id,
                "full_name": widget.name,
                "phone_num": widget.phone.toString(),
                "event_date": widget.date,
                "event_time": widget.time,
                "event_title": widget.title,
                "personnel_treatment": _personel.text,
                "music": _music.text,
                "flower_arrangement": _flower.text,
                "food_quality": _food.text,
                "rating": _rating.text,
                "suggestions": _suggestions.text,
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
      _personel.text = widget.data["personnel_treatment"] ?? "";
      _music.text = widget.data["music"] ?? "";
      _flower.text = widget.data["flower_arrangement"] ?? "";
      _food.text = widget.data["food_quality"] ?? "";
      _rating.text = widget.data["rating"] ?? "";
      _suggestions.text = widget.data["suggestions"] ?? "";
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
                    "فرم نظرسنجی مراسم",
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "برخورد پرسنل :",
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
                          controller: _personel,
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
                          "موزیک :",
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
                          controller: _music,
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
                          "گل آرایی :",
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
                          controller: _flower,
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
                          "کیفیت غذا :",
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
                          controller: _food,
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
                          "نمره :",
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
                          controller: _rating,
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
                          "انتقادات و پیشنهادات :",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          onChanged: (e) {},
                          controller: _suggestions,
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
                            color: (_personel.text.isEmpty ||
                                    _music.text.isEmpty ||
                                    _music.text.isEmpty ||
                                    _flower.text.isEmpty ||
                                    _food.text.isEmpty ||
                                    _rating.text.isEmpty)
                                ? Colors.grey
                                : Color.fromRGBO(40, 75, 42, 1),
                            onPressed: (con) {
                              if (_personel.text.isEmpty ||
                                  _music.text.isEmpty ||
                                  _music.text.isEmpty ||
                                  _flower.text.isEmpty ||
                                  _food.text.isEmpty ||
                                  _rating.text.isEmpty) {
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
