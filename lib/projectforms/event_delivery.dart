import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';

class EventDeliveryFormScreen extends StatefulWidget {
  final String id;
  final dynamic data;

  const EventDeliveryFormScreen(
      {super.key, required this.id, required this.data});

  @override
  State<EventDeliveryFormScreen> createState() =>
      _EventDeliveryFormScreenState();
}

class _EventDeliveryFormScreenState extends State<EventDeliveryFormScreen> {
  FilePickerResult? resultFile;
  late Uint8List conImage;
  String _pic = "";
  final TextEditingController fruit1 = TextEditingController();
  final TextEditingController fruit2 = TextEditingController();
  final TextEditingController fruit3 = TextEditingController();
  final TextEditingController fruit4 = TextEditingController();
  final TextEditingController _pastry = TextEditingController();
  final TextEditingController _fruitPastryDetail = TextEditingController();
  final TextEditingController _food = TextEditingController();
  final TextEditingController _extraFood = TextEditingController();
  final TextEditingController _foodDetail = TextEditingController();
  final TextEditingController _receptionComment = TextEditingController();
  final TextEditingController _musicComment = TextEditingController();
  final TextEditingController _designComment = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  var result;

  Future insertData(AnimationController controller) async {
    controller.forward();
    String fileName = "";
    if (_pic.isEmpty) {
      fileName = File(resultFile!.files.single.path!).path.split('/').last;
    } else {}
    FormData formData = FormData.fromMap({
      "contract": _pic.isEmpty
          ? await MultipartFile.fromFile(
              File(resultFile!.files.single.path!).path,
              filename: fileName,
            )
          : _pic,
      "project_id": widget.id,
      "fruit1": fruit1.text,
      "fruit2": fruit2.text,
      "fruit3": fruit3.text,
      "fruit4": fruit4.text,
      "pastry": _pastry.text,
      "fruit_pastry_detail": _fruitPastryDetail.text,
      "food": _food.text,
      "extra_food": _extraFood.text,
      "food_detail": _foodDetail.text,
      "reception_comment": _receptionComment.text,
      "design_comment": _designComment.text,
      "music_comment": _musicComment.text,
      "detail": _detail.text,
    });
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await dio.post(
          "https://pelakhaftapp.shop/api/inserteventdelivery",
          data: formData,
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
      fruit1.text = widget.data["fruit1"] ?? "";
      fruit2.text = widget.data["fruit2"] ?? "";
      fruit3.text = widget.data["fruit3"] ?? "";
      fruit4.text = widget.data["fruit4"] ?? "";
      _pastry.text = widget.data["pastry"] ?? "";
      _fruitPastryDetail.text = widget.data["fruit_pastry_detail"] ?? "";
      _food.text = widget.data["food"] ?? "";
      _extraFood.text = widget.data["extra_food"] ?? "";
      _foodDetail.text = widget.data["food_detail"] ?? "";
      _receptionComment.text = widget.data["reception_comment"] ?? "";
      _designComment.text = widget.data["design_comment"] ?? "";
      _musicComment.text = widget.data["music_comment"] ?? "";
      _detail.text = widget.data["detail"] ?? "";
      _pic = widget.data["contract"] ?? "";
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
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: SvgPicture.asset(
                "assets/general/homeBack.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
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
                      "تحویل مراسم",
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
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          StatefulBuilder(builder: (context, setState) {
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
                              height: MediaQuery.of(context).size.height / 1.1,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                      "تحویل میوه و شیرینی",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(40, 75, 42, 1)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "میوه :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: 45,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                onChanged: (e) {
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                                controller: fruit1,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIconColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        filled: true,
                                                        fillColor: Color.fromRGBO(
                                                            243, 243, 243, 1),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
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
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .transparent), //<-- SEE HERE
                                                        ),
                                                        focusColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        labelText: "",
                                                        hintText: "",
                                                        suffixIcon: Icon(Icons
                                                            .edit_outlined)),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Kg",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255,
                                                            124,
                                                            124,
                                                            124)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: 45,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (e) {
                                              setState(
                                                () {},
                                              );
                                            },
                                            controller: fruit2,
                                            decoration: const InputDecoration(
                                                prefixIconColor: Color.fromARGB(
                                                    255, 180, 180, 180),
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
                                                focusColor: Color.fromARGB(
                                                    255, 180, 180, 180),
                                                labelText: "",
                                                hintText: "",
                                                suffixIcon:
                                                    Icon(Icons.edit_outlined)),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  243, 243, 243, 1),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Kg",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 124, 124, 124)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: 45,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (e) {
                                              setState(
                                                () {},
                                              );
                                            },
                                            controller: fruit3,
                                            decoration: const InputDecoration(
                                                prefixIconColor: Color.fromARGB(
                                                    255, 180, 180, 180),
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
                                                focusColor: Color.fromARGB(
                                                    255, 180, 180, 180),
                                                labelText: "",
                                                hintText: "",
                                                suffixIcon:
                                                    Icon(Icons.edit_outlined)),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  243, 243, 243, 1),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Kg",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 124, 124, 124)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          height: 45,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (e) {
                                              setState(
                                                () {},
                                              );
                                            },
                                            controller: fruit4,
                                            decoration: const InputDecoration(
                                                prefixIconColor: Color.fromARGB(
                                                    255, 180, 180, 180),
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
                                                focusColor: Color.fromARGB(
                                                    255, 180, 180, 180),
                                                labelText: "",
                                                hintText: "",
                                                suffixIcon:
                                                    Icon(Icons.edit_outlined)),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  243, 243, 243, 1),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Kg",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 124, 124, 124)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "شیرینی :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: 45,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                onChanged: (e) {
                                                  setState(
                                                    () {},
                                                  );
                                                },
                                                controller: _pastry,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIconColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        filled: true,
                                                        fillColor: Color.fromRGBO(
                                                            243, 243, 243, 1),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
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
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .transparent), //<-- SEE HERE
                                                        ),
                                                        focusColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        labelText: "",
                                                        hintText: "",
                                                        suffixIcon: Icon(Icons
                                                            .edit_outlined)),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Kg",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255,
                                                            124,
                                                            124,
                                                            124)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "توضیحات :",
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
                                                  2.3 +
                                              45,
                                          height: 80,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (e) {
                                              setState(
                                                () {},
                                              );
                                            },
                                            controller: _fruitPastryDetail,
                                            decoration: const InputDecoration(
                                                prefixIconColor: Color.fromARGB(
                                                    255, 180, 180, 180),
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
                                                focusColor: Color.fromARGB(
                                                    255, 180, 180, 180),
                                                labelText: "",
                                                suffixIcon:
                                                    Icon(Icons.edit_outlined)),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
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
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "ثبت تغییرات",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            "assets/general/fruit.svg",
                            height: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                "تحویل میوه و شیرینی",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          StatefulBuilder(builder: (context, setState) {
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
                              height: MediaQuery.of(context).size.height / 1.5,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
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
                                      "تحویل غذا",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(40, 75, 42, 1)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "غذا :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: 45,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                onChanged: (e) {},
                                                controller: _food,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIconColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        filled: true,
                                                        fillColor: Color.fromRGBO(
                                                            243, 243, 243, 1),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
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
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .transparent), //<-- SEE HERE
                                                        ),
                                                        focusColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        labelText: "",
                                                        hintText: "",
                                                        suffixIcon: Icon(Icons
                                                            .edit_outlined)),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "پرس",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255,
                                                            124,
                                                            124,
                                                            124)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Text(
                                            "غذا اضافه :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: 45,
                                              child: TextFormField(
                                                style: TextStyle(
                                                    color: Colors.black),
                                                onChanged: (e) {},
                                                controller: _extraFood,
                                                decoration:
                                                    const InputDecoration(
                                                        prefixIconColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        filled: true,
                                                        fillColor: Color.fromRGBO(
                                                            243, 243, 243, 1),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
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
                                                                  Radius
                                                                      .circular(
                                                                          10.0)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .transparent), //<-- SEE HERE
                                                        ),
                                                        focusColor:
                                                            Color.fromARGB(255,
                                                                180, 180, 180),
                                                        labelText: "",
                                                        hintText: "",
                                                        suffixIcon: Icon(Icons
                                                            .edit_outlined)),
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      243, 243, 243, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "پرس",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255,
                                                            124,
                                                            124,
                                                            124)),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "توضیحات :",
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
                                                  2.3 +
                                              45,
                                          height: 80,
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            onChanged: (e) {},
                                            controller: _foodDetail,
                                            decoration: const InputDecoration(
                                                prefixIconColor: Color.fromARGB(
                                                    255, 180, 180, 180),
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
                                                focusColor: Color.fromARGB(
                                                    255, 180, 180, 180),
                                                labelText: "",
                                                suffixIcon:
                                                    Icon(Icons.edit_outlined)),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
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
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "ثبت تغییرات",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/general/food.svg",
                            height: 5,
                            width: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                "تحویل غذا",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                            height: MediaQuery.of(context).size.height / 1.05,
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(40, 75, 42, 1),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
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
                                    "انتقادات و پیشنهادات",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(40, 75, 42, 1)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "توضیحات :",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 80,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (e) {},
                                          controller: _detail,
                                          decoration: const InputDecoration(
                                              prefixIconColor: Color.fromARGB(
                                                  255, 180, 180, 180),
                                              filled: true,
                                              fillColor: Color.fromRGBO(
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
                                              suffixIcon:
                                                  Icon(Icons.edit_outlined)),
                                          autovalidateMode: AutovalidateMode
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
                                        "نظر شما درمورد پذیرایی و غذا چیست ؟",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 80,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (e) {},
                                          controller: _receptionComment,
                                          decoration: const InputDecoration(
                                              prefixIconColor: Color.fromARGB(
                                                  255, 180, 180, 180),
                                              filled: true,
                                              fillColor: Color.fromRGBO(
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
                                              suffixIcon:
                                                  Icon(Icons.edit_outlined)),
                                          autovalidateMode: AutovalidateMode
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
                                        "نظر شما در مورد دیزاین و تشریفات چیست ؟",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 80,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (e) {},
                                          controller: _designComment,
                                          decoration: const InputDecoration(
                                              prefixIconColor: Color.fromARGB(
                                                  255, 180, 180, 180),
                                              filled: true,
                                              fillColor: Color.fromRGBO(
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
                                              suffixIcon:
                                                  Icon(Icons.edit_outlined)),
                                          autovalidateMode: AutovalidateMode
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
                                        "نظر شما در مورد موزیک چیست ؟",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 80,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (e) {},
                                          controller: _musicComment,
                                          decoration: const InputDecoration(
                                              prefixIconColor: Color.fromARGB(
                                                  255, 180, 180, 180),
                                              filled: true,
                                              fillColor: Color.fromRGBO(
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
                                              suffixIcon:
                                                  Icon(Icons.edit_outlined)),
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                "ثبت تغییرات",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
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
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/general/suggest.svg",
                            height: 5,
                            width: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                "انتقادات و پیشنهادات",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    resultFile = await FilePicker.platform.pickFiles();
                    if (resultFile == null) {
                      print("No file selected");
                    } else {
                      conImage = await resultFile!.files[0].xFile.readAsBytes();
                      setState(() {
                        _pic = "";
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 202, 202, 202),
                                  blurRadius: 20)
                            ],
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/general/form.svg",
                            height: 5,
                            width: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                "آپلود فرم امضا شده",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 112, 112, 112)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 17,
                                color: Color.fromRGBO(40, 75, 42, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 202, 202, 202),
                            blurRadius: 20)
                      ],
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 235, 235),
                          borderRadius: BorderRadius.circular(6)),
                      child: ((resultFile?.files.length == null ||
                                  resultFile?.files.length == 0) &&
                              _pic == "")
                          ? Padding(
                              padding: const EdgeInsets.all(80.0),
                              child: Center(
                                child: Text(
                                  "Picture",
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: Color.fromRGBO(91, 91, 91, 1)),
                                ),
                              ),
                            )
                          : Stack(children: [
                              _pic == ""
                                  ? Image.memory(conImage)
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "https://pelakhaftapp.shop/storage/files/deliveryContract/$_pic",
                                      placeholder: (context, url) => Opacity(
                                        opacity: 0.5,
                                        child: Image.asset(
                                          "assets/general/logoAlt.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                              Positioned(
                                bottom: 5,
                                left: 5,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      resultFile = null;
                                      conImage = Uint8List(0);
                                      _pic = "";
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                        size: 21,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ProgressButton(
                    borderRadius: BorderRadius.circular(6),
                    strokeWidth: 3,
                    progressIndicatorSize: 20,
                    color: (fruit1.text.isEmpty ||
                            fruit2.text.isEmpty ||
                            fruit3.text.isEmpty ||
                            fruit4.text.isEmpty ||
                            _pastry.text.isEmpty ||
                            _food.text.isEmpty ||
                            _extraFood.text.isEmpty ||
                            _receptionComment.text.isEmpty ||
                            _musicComment.text.isEmpty ||
                            _designComment.text.isEmpty ||
                            _receptionComment.text.isEmpty ||
                            (resultFile?.files.length == null ||
                                    resultFile!.files.isEmpty) &&
                                _pic.isEmpty)
                        ? Colors.grey
                        : Color.fromRGBO(40, 75, 42, 1),
                    onPressed: (con) {
                      if (fruit1.text.isEmpty ||
                          fruit2.text.isEmpty ||
                          fruit3.text.isEmpty ||
                          fruit4.text.isEmpty ||
                          _pastry.text.isEmpty ||
                          _food.text.isEmpty ||
                          _extraFood.text.isEmpty ||
                          _receptionComment.text.isEmpty ||
                          _musicComment.text.isEmpty ||
                          _designComment.text.isEmpty ||
                          _receptionComment.text.isEmpty ||
                          (resultFile?.files.length == null ||
                                  resultFile!.files.isEmpty) &&
                              _pic.isEmpty) {
                      } else {
                        insertData(con).then((value) {
                          if (result["message"] == "فرم با موفقیت ثبت شد.") {
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
                  height: 50,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
