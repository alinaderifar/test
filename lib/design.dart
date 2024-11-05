import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_ipa_export/components/globals.dart";
import "package:flutter_ipa_export/components/progress_button.dart";

class DesignScreen extends StatefulWidget {
  final String id;
  final dynamic data;

  const DesignScreen({super.key, required this.id, required this.data});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  bool flowerCon = false;
  bool designCon = false;
  bool arangmentCon = false;
  bool checkListCon = false;
  String naturalPlacement = "";
  String naturalGuestTable = "";

  final TextEditingController _entrance = TextEditingController();
  final TextEditingController _naturalDetail = TextEditingController();
  final TextEditingController _naturalGuestDetail = TextEditingController();
  final TextEditingController _entranceDetail = TextEditingController();
  final TextEditingController _flowerDetail = TextEditingController();

  final TextEditingController _welcomeCard = TextEditingController();
  final TextEditingController _tableStand = TextEditingController();
  final TextEditingController _welcomeRose = TextEditingController();
  final TextEditingController _cakeTable = TextEditingController();
  final TextEditingController _gift = TextEditingController();
  final TextEditingController _notbook = TextEditingController();
  final TextEditingController _settingCandle = TextEditingController();
  final TextEditingController _weddingCandle = TextEditingController();
  final TextEditingController _guestTableCandle = TextEditingController();
  final TextEditingController _designDetail = TextEditingController();

  String reception = "";
  String church = "";
  String guestChair = "";
  String guestTable = "";
  final TextEditingController _receptionDetail = TextEditingController();
  final TextEditingController _churchetail = TextEditingController();
  final TextEditingController _guestChairDetail = TextEditingController();
  final TextEditingController _guestTableDetail = TextEditingController();
  final TextEditingController _handkerchief = TextEditingController();
  final TextEditingController _fruitBowl = TextEditingController();
  final TextEditingController _candle = TextEditingController();
  final TextEditingController _arrangDetail = TextEditingController();

  var result;

  Future insertFlowerData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertflower",
              data: {
                "project_id": widget.id,
                "natural_placement": naturalPlacement,
                "natural_placement_detail": _naturalDetail.text,
                "natural_guest_table": naturalGuestTable,
                "natural_guest_table_detail": _naturalGuestDetail.text,
                "entrance": _entrance.text,
                "entrance_detail": _entranceDetail.text,
                "detail": _flowerDetail.text,
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

  Future insertDesignData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertdesign",
              data: {
                "project_id": widget.id,
                "welcome_card": _welcomeCard.text,
                "table_stand": _tableStand.text,
                "welcome_rose": _welcomeRose.text,
                "cake_table": _cakeTable.text,
                "gift": _gift.text,
                "notebook": _notbook.text,
                "setting_candle": _settingCandle.text,
                "wedding_candle": _weddingCandle.text,
                "guest_table_candle": _guestTableCandle.text,
                "detail": _designDetail.text,
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

  Future insertArrangData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertarrang",
              data: {
                "project_id": widget.id,
                "reception": reception,
                "reception_detail": _receptionDetail.text,
                "church": church,
                "church_detail": _churchetail.text,
                "guest_table": guestTable,
                "guest_table_detail": _guestTableDetail.text,
                "guest_chair": guestChair,
                "guest_chair_detail": _guestChairDetail.text,
                "handkerchief": _handkerchief.text,
                "fruit_bowl": _fruitBowl.text,
                "candle": _candle.text,
                "detail": _arrangDetail.text,
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
    if (widget.data["flower"] != null) {
      naturalPlacement = widget.data["flower"]["natural_placement"] ?? "";
      _naturalDetail.text =
          widget.data["flower"]["natural_placement_detail"] ?? "";
      naturalGuestTable = widget.data["flower"]["natural_guest_table"] ?? "";
      _naturalGuestDetail.text =
          widget.data["flower"]["natural_guest_table_detail"] ?? "";
      _entrance.text = widget.data["flower"]["entrance"] ?? "";
      _entranceDetail.text = widget.data["flower"]["entrance_detail"] ?? "";
      _flowerDetail.text = widget.data["flower"]["detail"] ?? "";
    }
    if (widget.data["design"] != null) {
      _welcomeCard.text = widget.data["design"]["welcome_card"] ?? "";
      _tableStand.text = widget.data["design"]["table_stand"] ?? "";
      _welcomeRose.text = widget.data["design"]["welcome_rose"] ?? "";
      _cakeTable.text = widget.data["design"]["cake_table"] ?? "";
      _gift.text = widget.data["design"]["gift"] ?? "";
      _notbook.text = widget.data["design"]["notebook"] ?? "";
      _settingCandle.text = widget.data["design"]["setting_candle"] ?? "";
      _weddingCandle.text = widget.data["design"]["wedding_candle"] ?? "";
      _guestTableCandle.text =
          widget.data["design"]["guest_table_candle"] ?? "";
      _designDetail.text = widget.data["design"]["detail"] ?? "";
    }
    if (widget.data["arrangement"] != null) {
      reception = widget.data["arrangement"]["reception"] ?? "";
      _receptionDetail.text =
          widget.data["arrangement"]["reception_detail"] ?? "";
      church = widget.data["arrangement"]["church"] ?? "";
      _churchetail.text = widget.data["arrangement"]["church_detail"] ?? "";
      guestTable = widget.data["arrangement"]["guest_table"] ?? "";
      _guestTableDetail.text =
          widget.data["arrangement"]["guest_table_detail"] ?? "";
      guestChair = widget.data["arrangement"]["guest_chair"] ?? "";
      _guestChairDetail.text =
          widget.data["arrangement"]["guest_chair_detail"] ?? "";
      _handkerchief.text = widget.data["arrangement"]["handkerchief"] ?? "";
      _fruitBowl.text = widget.data["arrangement"]["fruit_bowl"] ?? "";
      _candle.text = widget.data["arrangement"]["candle"] ?? "";
      _arrangDetail.text = widget.data["arrangement"]["detail"] ?? "";
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
                  "دیزاین",
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
                      flowerCon = !flowerCon;
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
                            "گل آرایی طبیعی جایگاه",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            flowerCon
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_sharp,
                            color: Color.fromRGBO(40, 75, 42, 1),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (flowerCon)
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
                              "گل آرایی طبیعی جایگاه :",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalPlacement == "سطح یک",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalPlacement = "سطح یک";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("سطح یک"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 70),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalPlacement == "سطح دو",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalPlacement = "سطح دو";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("سطح دو"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalPlacement == "سطح سه",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalPlacement = "سطح سه";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("سطح سه"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 70),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalPlacement == "رویال",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalPlacement = "رویال";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("رویال"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
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
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                onChanged: (e) {
                                  setState(() {});
                                },
                                controller: _naturalDetail,
                                decoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 180, 180, 180),
                                    filled: true,
                                    fillColor: _naturalDetail.text.isNotEmpty
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
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "گل آرایی طبیعی میز مهمان :",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalGuestTable == "سطح یک",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalGuestTable = "سطح یک";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("سطح یک"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 70),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalGuestTable == "VIP",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalGuestTable = "VIP";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("VIP"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 245, 245, 245),
                                              blurRadius: 20,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Checkbox(
                                        value: naturalGuestTable == "رویال",
                                        onChanged: (e) {
                                          setState(() {
                                            naturalGuestTable = "رویال";
                                          });
                                        },
                                        activeColor:
                                            Color.fromRGBO(40, 75, 42, 1),
                                        side: BorderSide(
                                            color: const Color.fromARGB(
                                                255, 192, 192, 192)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                    ),
                                    Text("رویال"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
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
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                onChanged: (e) {
                                  setState(() {});
                                },
                                controller: _naturalGuestDetail,
                                decoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 180, 180, 180),
                                    filled: true,
                                    fillColor:
                                        _naturalGuestDetail.text.isNotEmpty
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
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "گل آرایی ورودی",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                onChanged: (e) {
                                  setState(() {});
                                },
                                controller: _entrance,
                                decoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 180, 180, 180),
                                    filled: true,
                                    fillColor: _entrance.text.isNotEmpty
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
                            SizedBox(
                              height: 10,
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
                              height: 50,
                              child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                onChanged: (e) {
                                  setState(() {});
                                },
                                controller: _entranceDetail,
                                decoration: InputDecoration(
                                    prefixIconColor:
                                        Color.fromARGB(255, 180, 180, 180),
                                    filled: true,
                                    fillColor: _entranceDetail.text.isNotEmpty
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
                            SizedBox(
                              height: 20,
                            ),
                            ProgressButton(
                                borderRadius: BorderRadius.circular(6),
                                strokeWidth: 3,
                                progressIndicatorSize: 20,
                                color: (naturalPlacement.isEmpty &&
                                        naturalGuestTable.isEmpty &&
                                        _entrance.text.isEmpty)
                                    ? Colors.grey
                                    : Color.fromRGBO(40, 75, 42, 1),
                                onPressed: (con) {
                                  if (naturalPlacement.isEmpty &&
                                      naturalGuestTable.isEmpty &&
                                      _entrance.text.isEmpty) {
                                  } else {
                                    insertFlowerData(con).then((value) {
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
                  designCon = !designCon;
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
                        "دیزاین و تشریفات",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        designCon
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (designCon)
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
                          "کارت ولکام :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _welcomeCard,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _welcomeCard.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "استند و میز ولکام :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _tableStand,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _tableStand.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "رز ولکام :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _welcomeRose,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _welcomeRose.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "دیزاین میز کیک :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _cakeTable,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _cakeTable.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "گیفت :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _gift,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _gift.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "دفتر یادبود :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _notbook,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _notbook.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "شمع آرایی محیطی :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _settingCandle,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _settingCandle.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "شمع آرایی VIP سفره عقد :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _weddingCandle,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _weddingCandle.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "شمع آرایی VIP میز مهمان :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _guestTableCandle,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _guestTableCandle.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {
                              setState(() {});
                            },
                            controller: _designDetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _designDetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProgressButton(
                            borderRadius: BorderRadius.circular(6),
                            strokeWidth: 3,
                            progressIndicatorSize: 20,
                            color: Color.fromRGBO(40, 75, 42, 1),
                            onPressed: (con) {
                              insertDesignData(con).then((value) {
                                if (result["message"] ==
                                    "فرم با موفقیت ثبت شد.") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarSuccess);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarfail);
                                }
                              });
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
                          height: 25,
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
                  arangmentCon = !arangmentCon;
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
                        "چیدمان",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        arangmentCon
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down_sharp,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (arangmentCon)
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
                          "سرویس پذیرایی :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: reception == "چیدمان VIP",
                                    onChanged: (e) {
                                      setState(() {
                                        reception = "چیدمان VIP";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text("چیدمان VIP"),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            SizedBox(width: 70),
                          ],
                        ),
                        SizedBox(
                          height: 2,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _receptionDetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _receptionDetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "چیدمان کلیسایی :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: church == "نیمکت",
                                    onChanged: (e) {
                                      setState(() {
                                        church = "نیمکت";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text(
                                  "نیمکت",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: church == "صندلی رستیک (چوبی)",
                                    onChanged: (e) {
                                      setState(() {
                                        church = "صندلی رستیک (چوبی)";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text("صندلی رستیک (چوبی)",
                                    style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: church == "صندلی شیواری (سفید)",
                                    onChanged: (e) {
                                      setState(() {
                                        church = "صندلی شیواری (سفید)";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text(
                                  "صندلی شیواری (سفید)",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: church == "ورودی راهرو سفید",
                                    onChanged: (e) {
                                      setState(() {
                                        church = "ورودی راهرو سفید";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text("ورودی راهرو سفید",
                                    style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: church == "حریر پشت صندلی",
                                    onChanged: (e) {
                                      setState(() {
                                        church = "حریر پشت صندلی";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text(
                                  "حریر پشت صندلی",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _churchetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _churchetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "صندلی میز مهمان :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: guestChair == "رستیک",
                                    onChanged: (e) {
                                      setState(() {
                                        guestChair = "رستیک";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text(
                                  "رستیک",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: guestChair == "شیواری",
                                    onChanged: (e) {
                                      setState(() {
                                        guestChair = "شیواری";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text("شیواری", style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _guestChairDetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _guestChairDetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "دیزاین میز مهمان :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: guestTable == "رومیزی",
                                    onChanged: (e) {
                                      setState(() {
                                        guestTable = "رومیزی";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text(
                                  "رومیزی",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      blurRadius: 20,
                                    )
                                  ], borderRadius: BorderRadius.circular(20)),
                                  child: Checkbox(
                                    value: guestTable == "رانر",
                                    onChanged: (e) {
                                      setState(() {
                                        guestTable = "رانر";
                                      });
                                    },
                                    activeColor: Color.fromRGBO(40, 75, 42, 1),
                                    side: BorderSide(
                                        color: const Color.fromARGB(
                                            255, 192, 192, 192)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                Text("رانر", style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _guestTableDetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _guestTableDetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "رنگ دسمال سفره :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _handkerchief,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _handkerchief.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "مدل میوه خوری :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _fruitBowl,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _fruitBowl.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "رنگ بار سوخت :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 128, 128),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _candle,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _candle.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (e) {},
                            controller: _arrangDetail,
                            decoration: InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: _arrangDetail.text.isNotEmpty
                                    ? Color.fromARGB(255, 226, 226, 226)
                                    : Color.fromRGBO(243, 243, 243, 1),
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
                                suffixIcon: Icon(
                                  Icons.edit_outlined,
                                  size: 18,
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ProgressButton(
                            borderRadius: BorderRadius.circular(6),
                            strokeWidth: 3,
                            progressIndicatorSize: 20,
                            color: Color.fromRGBO(40, 75, 42, 1),
                            onPressed: (con) {
                              insertArrangData(con).then((value) {
                                if (result["message"] ==
                                    "فرم با موفقیت ثبت شد.") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarSuccess);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBarfail);
                                }
                              });
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
                          height: 25,
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
            if (checkListCon)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 202, 202, 202),
                            blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text("1",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.45,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 243, 243, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "جلسه با مشتری",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.red,
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey[700],
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.33,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              " نظر جدید در چک لیست",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text("0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.55,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              "1403/05/25",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Icon(
                                                      Icons.edit_outlined,
                                                      color: Colors.grey[700],
                                                      size: 21,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Icon(
                                          Icons.notifications_active_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(40, 75, 42, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text("02",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.45,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 243, 243, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "جلسه با مشتری",
                                      style: TextStyle(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.red,
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey[700],
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.33,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              " نظر جدید در چک لیست",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text("0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.55,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              "1403/05/25",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    40, 75, 42, 1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Icon(
                                                      Icons.edit_outlined,
                                                      color: Colors.grey[700],
                                                      size: 21,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Icon(
                                          Icons.notifications_active_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text("03",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.45,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 243, 243, 1),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "جلسه با مشتری",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.delete_forever,
                                              color: Colors.red,
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.grey[700],
                                              size: 21,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.33,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              " نظر جدید در چک لیست",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text("0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2.55,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          2.8,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 243, 243, 1),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              "1403/05/25",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: Icon(
                                                      Icons.edit_outlined,
                                                      color: Colors.grey[700],
                                                      size: 21,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Icon(
                                          Icons.notifications_active_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 75, 42, 1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      "ثبت تغییرات",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
