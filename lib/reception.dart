import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_ipa_export/components/globals.dart";
import "package:flutter_ipa_export/components/progress_button.dart";

class ReceptionScreen extends StatefulWidget {
  final String id;
  final dynamic data;

  const ReceptionScreen({super.key, required this.id, required this.data});

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  bool preArrangmentCon = false;
  bool arrangmentCon = false;
  bool checkListCon = false;
  final TextEditingController _fruits = TextEditingController();
  final TextEditingController _pastry = TextEditingController();
  final TextEditingController _juice = TextEditingController();
  final TextEditingController _chai = TextEditingController();
  final TextEditingController _cake = TextEditingController();
  final TextEditingController _bread = TextEditingController();
  final TextEditingController _finger = TextEditingController();
  final TextEditingController _bartender = TextEditingController();
  final TextEditingController _aragh = TextEditingController();
  final TextEditingController _choclate = TextEditingController();
  final TextEditingController _nuts = TextEditingController();
  final TextEditingController _taste = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  final TextEditingController _mealType = TextEditingController();
  final TextEditingController _baseMenu = TextEditingController();
  final TextEditingController _meatMenu = TextEditingController();
  final TextEditingController _veganMenu = TextEditingController();
  final TextEditingController _recptionDetail = TextEditingController();

  var result;

  Future insertPreData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertprereception",
              data: {
                "project_id": widget.id,
                "fruits": _fruits.text,
                "pastry": _pastry.text,
                "juice": _juice.text,
                "chai_cafe": _chai.text,
                "cake": _cake.text,
                "bread_cheese": _bread.text,
                "finger_food": _finger.text,
                "bartender": _bartender.text,
                "aragh_faloodeh": _aragh.text,
                "choclate": _choclate.text,
                "nuts": _nuts.text,
                "taste_table": _taste.text,
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

  Future insertReceptionData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertreception",
              data: {
                "project_id": widget.id,
                "meal_type": _mealType.text,
                "base_menu": _baseMenu.text,
                "meat_menu": _meatMenu.text,
                "vegan_menu": _veganMenu.text,
                "detail": _recptionDetail.text,
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
    if (widget.data["pre"] != null) {
      _fruits.text = widget.data["pre"]["fruits"] ?? "";
      _pastry.text = widget.data["pre"]["pastry"] ?? "";
      _juice.text = widget.data["pre"]["juice"] ?? "";
      _chai.text = widget.data["pre"]["chai_cafe"] ?? "";
      _cake.text = widget.data["pre"]["cake"] ?? "";
      _bread.text = widget.data["pre"]["bread_cheese"] ?? "";
      _finger.text = widget.data["pre"]["finger_food"] ?? "";
      _bartender.text = widget.data["pre"]["bartender"] ?? "";
      _aragh.text = widget.data["pre"]["aragh_faloodeh"] ?? "";
      _choclate.text = widget.data["pre"]["choclate"] ?? "";
      _nuts.text = widget.data["pre"]["nuts"] ?? "";
      _taste.text = widget.data["pre"]["taste_table"] ?? "";
      _detail.text = widget.data["pre"]["detail"] ?? "";
    }
    if (widget.data["reception"] != null) {
      _mealType.text = widget.data["reception"]["meal_type"] ?? "";
      _baseMenu.text = widget.data["reception"]["base_menu"] ?? "";
      _meatMenu.text = widget.data["reception"]["meat_menu"] ?? "";
      _veganMenu.text = widget.data["reception"]["vegan_menu"] ?? "";
      _recptionDetail.text = widget.data["reception"]["detail"] ?? "";
    }

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
                  "پذیرایی",
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
            Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      preArrangmentCon = !preArrangmentCon;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 226, 226, 226),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "پیش پذیرایی",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            preArrangmentCon
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_sharp,
                            color: Color.fromRGBO(40, 75, 42, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (preArrangmentCon)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _fruits,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _fruits.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_fruits.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _fruits.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _pastry,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _pastry.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_pastry.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _pastry.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _juice,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _juice.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_juice.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _juice.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _chai,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _chai.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_chai.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _juice.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _cake,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _cake.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_cake.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _cake.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _bread,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _bread.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_bread.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _bread.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _bartender,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor:
                                                _bartender.text.isNotEmpty
                                                    ? Color.fromARGB(
                                                        255, 226, 226, 226)
                                                    : Color.fromRGBO(
                                                        243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_bartender.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _bartender.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _finger,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _finger.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_finger.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _finger.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _aragh,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _aragh.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_aragh.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _aragh.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _choclate,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _choclate.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_choclate.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _choclate.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _nuts,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _nuts.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_nuts.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _nuts.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _taste,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _taste.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_taste.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _taste.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.24,
                                      height: 50,
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        onChanged: (e) {
                                          setState(() {});
                                        },
                                        controller: _detail,
                                        decoration: InputDecoration(
                                            prefixIconColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            filled: true,
                                            fillColor: _detail.text.isNotEmpty
                                                ? Color.fromARGB(
                                                    255, 226, 226, 226)
                                                : Color.fromRGBO(
                                                    243, 243, 243, 1),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 5,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors
                                                      .transparent), //<-- SEE HERE
                                            ),
                                            focusColor: Color.fromARGB(
                                                255, 180, 180, 180),
                                            labelText: "",
                                            suffixIcon: Icon(
                                              Icons.edit_outlined,
                                              size: 18,
                                            )),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
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
                                            if (_detail.text.isEmpty)
                                              BoxShadow(
                                                  color: const Color.fromARGB(
                                                      255, 219, 219, 219),
                                                  blurRadius: 5)
                                          ],
                                          color: _detail.text.isEmpty
                                              ? Colors.white
                                              : Color.fromRGBO(40, 75, 42, 1),
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
                            ProgressButton(
                                borderRadius: BorderRadius.circular(6),
                                strokeWidth: 3,
                                progressIndicatorSize: 20,
                                color: (_fruits.text.isEmpty &&
                                        _pastry.text.isEmpty)
                                    ? Colors.grey
                                    : Color.fromRGBO(40, 75, 42, 1),
                                onPressed: (con) {
                                  if (_fruits.text.isEmpty &&
                                      _pastry.text.isEmpty) {
                                  } else {
                                    insertPreData(con).then((value) {
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
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  arrangmentCon = !arrangmentCon;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "پذیرایی غذا",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        arrangmentCon
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (arrangmentCon)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
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
                          "انتخاب وعده :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.24,
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: _mealType,
                                    decoration: InputDecoration(
                                        prefixIconColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        filled: true,
                                        fillColor: _mealType.text.isNotEmpty
                                            ? Color.fromARGB(255, 226, 226, 226)
                                            : Color.fromRGBO(243, 243, 243, 1),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        focusColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        labelText: "",
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                        if (_mealType.text.isEmpty)
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              blurRadius: 5)
                                      ],
                                      color: _mealType.text.isEmpty
                                          ? Colors.white
                                          : Color.fromRGBO(40, 75, 42, 1),
                                      borderRadius: BorderRadius.circular(6)),
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
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.24,
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: _baseMenu,
                                    decoration: InputDecoration(
                                        prefixIconColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        filled: true,
                                        fillColor: _baseMenu.text.isNotEmpty
                                            ? Color.fromARGB(255, 226, 226, 226)
                                            : Color.fromRGBO(243, 243, 243, 1),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        focusColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        labelText: "",
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                        if (_baseMenu.text.isEmpty)
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              blurRadius: 5)
                                      ],
                                      color: _baseMenu.text.isEmpty
                                          ? Colors.white
                                          : Color.fromRGBO(40, 75, 42, 1),
                                      borderRadius: BorderRadius.circular(6)),
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
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.24,
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: _meatMenu,
                                    decoration: InputDecoration(
                                        prefixIconColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        filled: true,
                                        fillColor: _meatMenu.text.isNotEmpty
                                            ? Color.fromARGB(255, 226, 226, 226)
                                            : Color.fromRGBO(243, 243, 243, 1),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        focusColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        labelText: "",
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                        if (_meatMenu.text.isEmpty)
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              blurRadius: 5)
                                      ],
                                      color: _meatMenu.text.isEmpty
                                          ? Colors.white
                                          : Color.fromRGBO(40, 75, 42, 1),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "منو غذاهای  غیر گوشتی :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.24,
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: _veganMenu,
                                    decoration: InputDecoration(
                                        prefixIconColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        filled: true,
                                        fillColor: _veganMenu.text.isNotEmpty
                                            ? Color.fromARGB(255, 226, 226, 226)
                                            : Color.fromRGBO(243, 243, 243, 1),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        focusColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        labelText: "",
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                        if (_veganMenu.text.isEmpty)
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              blurRadius: 5)
                                      ],
                                      color: _veganMenu.text.isEmpty
                                          ? Colors.white
                                          : Color.fromRGBO(40, 75, 42, 1),
                                      borderRadius: BorderRadius.circular(6)),
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
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.24,
                                  height: 50,
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (e) {
                                      setState(() {});
                                    },
                                    controller: _recptionDetail,
                                    decoration: InputDecoration(
                                        prefixIconColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        filled: true,
                                        fillColor: _recptionDetail
                                                .text.isNotEmpty
                                            ? Color.fromARGB(255, 226, 226, 226)
                                            : Color.fromRGBO(243, 243, 243, 1),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors
                                                  .transparent), //<-- SEE HERE
                                        ),
                                        focusColor:
                                            Color.fromARGB(255, 180, 180, 180),
                                        labelText: "",
                                        suffixIcon: Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                        )),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
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
                                        if (_recptionDetail.text.isEmpty)
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  255, 219, 219, 219),
                                              blurRadius: 5)
                                      ],
                                      color: _recptionDetail.text.isEmpty
                                          ? Colors.white
                                          : Color.fromRGBO(40, 75, 42, 1),
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProgressButton(
                            borderRadius: BorderRadius.circular(6),
                            strokeWidth: 3,
                            progressIndicatorSize: 20,
                            color: (_mealType.text.isEmpty ||
                                    _baseMenu.text.isEmpty)
                                ? Colors.grey
                                : Color.fromRGBO(40, 75, 42, 1),
                            onPressed: (con) {
                              if (_mealType.text.isEmpty ||
                                  _baseMenu.text.isEmpty) {
                              } else {
                                insertReceptionData(con).then((value) {
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
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  checkListCon = !checkListCon;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226),
                          blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "افزودن چک لیست شخصی",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        checkListCon
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      )
                    ],
                  ),
                ),
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
