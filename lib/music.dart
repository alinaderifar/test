import "dart:async";
import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_ipa_export/components/globals.dart";
import "package:flutter_ipa_export/components/progress_button.dart";

class MusicScreen extends StatefulWidget {
  final String id;
  final String title;
  final dynamic data;

  const MusicScreen(
      {super.key, required this.id, required this.title, required this.data});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool arrangmentCon = false;
  List<TimeTableItems> timetables = [
    TimeTableItems(
        id: 1, start: "07:00", title: "ورودی مهمان ها", end: "08:00"),
    TimeTableItems(
        id: 2, start: "08:00", title: "ورودی عروس و داماد", end: "08:30"),
    TimeTableItems(
        id: 3, start: "08:30", title: "اجرای خطبه عقد", end: "09:00"),
    TimeTableItems(id: 4, start: "09:00", title: "تانگو", end: "09:30"),
    TimeTableItems(
        id: 5, start: "09:30", title: "پذیرایی - کادو", end: "10:30"),
    TimeTableItems(id: 6, start: "10:30", title: "رقص کیک", end: "11:45"),
    TimeTableItems(id: 7, start: "11:45", title: "پذیرایی غذا", end: "12:30"),
    TimeTableItems(id: 8, start: "12:30", title: "پخش کلیپ", end: "12:45"),
    TimeTableItems(id: 9, start: "12:45", title: "رقص دونفره", end: "01:30"),
  ];
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _eventTitle = TextEditingController();
  final TextEditingController _endTime = TextEditingController();

  final TextEditingController _items = TextEditingController();
  final TextEditingController _performes = TextEditingController();
  final TextEditingController _atelieh = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  final TextEditingController _scheduleDetail = TextEditingController();

  var _timer;

  var result;

  Map _schedule = {};

  @override
  void initState() {
    if (widget.data["music"] != null) {
      _items.text = widget.data["music"]["items"] ?? "";
      _performes.text = widget.data["music"]["performers"] ?? "";
      _atelieh.text = widget.data["music"]["atelieh"] ?? "";
      _detail.text = widget.data["music"]["detail"] ?? "";
    }
    if (widget.data["performences"] != null &&
        widget.data["performences"].isNotEmpty &&
        widget.data["schedule"] != null) {
      timetables = [];
      for (int i = 0; i < widget.data["performences"].length; i++) {
        timetables.add(TimeTableItems(
            id: i + 1,
            start: widget.data["performences"][i]["start_time"],
            title: widget.data["performences"][i]["title"],
            end: widget.data["performences"][i]["end_time"]));
      }
    }
    if (mounted) {
      _timer = Timer.periodic(
          Duration(milliseconds: 1000), (Timer t) => setState(() {}));
    }
    super.initState();
  }

  Future insertMusicData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertmusic",
              data: {
                "project_id": widget.id,
                "items": _items.text,
                "performers": _performes.text,
                "atelieh": _atelieh.text,
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

  Future insertScheduleData(AnimationController controller) async {
    controller.forward();

    for (var i in timetables) {
      var mi = {
        i.id.toString(): {"tt": i.title, "st": i.start, "et": i.end}
      };
      _schedule.addAll(mi);
    }
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertschedule",
              data: {
                "project_id": widget.id,
                "event_type": widget.title,
                "start_time": timetables.first.start,
                "end_time": timetables.last.end,
                "items": _schedule,
                "detail": _scheduleDetail.text,
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
  void dispose() {
    _timer.cancel();
    super.dispose();
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "موسیقی و زمانبندی",
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
              Text(
                "انتخاب نوع موسیقی :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                onChanged: (e) {},
                controller: _items,
                decoration: const InputDecoration(
                    prefixIconColor: Color.fromARGB(255, 180, 180, 180),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 5, color: Colors.transparent), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 2, color: Colors.transparent), //<-- SEE HERE
                    ),
                    focusColor: Color.fromARGB(255, 180, 180, 180),
                    labelText: "",
                    suffixIcon: Icon(Icons.edit_outlined)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "اجرا کننده :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                onChanged: (e) {},
                controller: _performes,
                decoration: const InputDecoration(
                    prefixIconColor: Color.fromARGB(255, 180, 180, 180),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 5, color: Colors.transparent), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 2, color: Colors.transparent), //<-- SEE HERE
                    ),
                    focusColor: Color.fromARGB(255, 180, 180, 180),
                    labelText: "",
                    suffixIcon: Icon(Icons.edit_outlined)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "آتلیه :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                onChanged: (e) {},
                controller: _atelieh,
                decoration: const InputDecoration(
                    prefixIconColor: Color.fromARGB(255, 180, 180, 180),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 5, color: Colors.transparent), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 2, color: Colors.transparent), //<-- SEE HERE
                    ),
                    focusColor: Color.fromARGB(255, 180, 180, 180),
                    labelText: "",
                    suffixIcon: Icon(Icons.edit_outlined)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 20,
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
                    prefixIconColor: Color.fromARGB(255, 180, 180, 180),
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 5, color: Colors.transparent), //<-- SEE HERE
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                          width: 2, color: Colors.transparent), //<-- SEE HERE
                    ),
                    focusColor: Color.fromARGB(255, 180, 180, 180),
                    labelText: "",
                    suffixIcon: Icon(Icons.edit_outlined)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(
                height: 10,
              ),
              ProgressButton(
                  borderRadius: BorderRadius.circular(6),
                  strokeWidth: 3,
                  progressIndicatorSize: 20,
                  color: (_items.text.isEmpty ||
                          _performes.text.isEmpty ||
                          _atelieh.text.isEmpty)
                      ? Colors.grey
                      : Color.fromRGBO(40, 75, 42, 1),
                  onPressed: (con) {
                    if (_items.text.isEmpty ||
                        _performes.text.isEmpty ||
                        _atelieh.text.isEmpty) {
                    } else {
                      insertMusicData(con).then((value) {
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
                height: 25,
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
                          "فرم زمان بندی",
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
                    width: MediaQuery.of(context).size.width,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color.fromRGBO(243, 243, 243, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Center(
                                    child: Text(
                                      "ساعت اجرا",
                                      style: TextStyle(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color.fromRGBO(243, 243, 243, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Center(
                                    child: Text(
                                      "عنوان اجرا",
                                      style: TextStyle(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color.fromRGBO(243, 243, 243, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Center(
                                    child: Text(
                                      "ساعت پایان",
                                      style: TextStyle(
                                          color: Color.fromRGBO(40, 75, 42, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: timetables
                                .map<Widget>(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3.0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            _startTime.text = e.start!;
                                            _eventTitle.text = e.title!;
                                            _endTime.text = e.end!;

                                            return AlertDialog(
                                                scrollable: true,
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      5.0,
                                                    ),
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.only(
                                                  top: 10.0,
                                                ),
                                                content: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.5,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "زمانبندی را وارد کنید :",
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "ساعت اجرا :",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              onChanged: (x) {
                                                                e.start = x;
                                                              },
                                                              controller:
                                                                  _startTime,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      prefixIconColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      filled:
                                                                          true,
                                                                      fillColor: Color.fromRGBO(
                                                                          243,
                                                                          243,
                                                                          243,
                                                                          1),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                5,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      focusColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      labelText:
                                                                          "",
                                                                      suffixIcon:
                                                                          Icon(Icons
                                                                              .edit_outlined)),
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "عنوان اجرا :",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              onChanged: (x) {
                                                                e.title = x;
                                                              },
                                                              controller:
                                                                  _eventTitle,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      prefixIconColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      filled:
                                                                          true,
                                                                      fillColor: Color.fromRGBO(
                                                                          243,
                                                                          243,
                                                                          243,
                                                                          1),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                5,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      focusColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      labelText:
                                                                          "",
                                                                      suffixIcon:
                                                                          Icon(Icons
                                                                              .edit_outlined)),
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "ساعت اتمام :",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            TextFormField(
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                              onChanged: (x) {
                                                                e.end = x;
                                                              },
                                                              controller:
                                                                  _endTime,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      prefixIconColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      filled:
                                                                          true,
                                                                      fillColor: Color.fromRGBO(
                                                                          243,
                                                                          243,
                                                                          243,
                                                                          1),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                5,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(10.0)),
                                                                        borderSide: BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                Colors.transparent), //<-- SEE HERE
                                                                      ),
                                                                      focusColor: Color.fromARGB(
                                                                          255,
                                                                          180,
                                                                          180,
                                                                          180),
                                                                      labelText:
                                                                          "",
                                                                      suffixIcon:
                                                                          Icon(Icons
                                                                              .edit_outlined)),
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                3),
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            40,
                                                                            75,
                                                                            42,
                                                                            1)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          25.0,
                                                                      vertical:
                                                                          8),
                                                                  child: Text(
                                                                    "ثبت تغییرات",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                timetables
                                                                    .remove(e);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                3),
                                                                    color: const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        160,
                                                                        41,
                                                                        32)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          25.0,
                                                                      vertical:
                                                                          8),
                                                                  child: Text(
                                                                    "حذف",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.1,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              221,
                                                              221,
                                                              221),
                                                      blurRadius: 5)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: Center(
                                                child: Text(
                                                  e.start!,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          40, 75, 42, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.1,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              221,
                                                              221,
                                                              221),
                                                      blurRadius: 5)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: Center(
                                                child: Text(
                                                  maxLines: 1,
                                                  e.title!,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          40, 75, 42, 1),
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4.1,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              221,
                                                              221,
                                                              221),
                                                      blurRadius: 5)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: Center(
                                                child: Text(
                                                  e.end!,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          40, 75, 42, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
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
                            controller: _scheduleDetail,
                            decoration: const InputDecoration(
                                prefixIconColor:
                                    Color.fromARGB(255, 180, 180, 180),
                                filled: true,
                                fillColor: Color.fromRGBO(243, 243, 243, 1),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                    timetables.add(TimeTableItems(
                                        id: timetables.last.id! + 1,
                                        start: "",
                                        title: "",
                                        end: ""));
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(
                                          color: Color.fromRGBO(69, 129, 72, 1),
                                          width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 8),
                                    child: Center(
                                      child: Text(
                                        "افزودن",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ProgressButton(
                                  borderRadius: BorderRadius.circular(6),
                                  strokeWidth: 3,
                                  progressIndicatorSize: 20,
                                  color:
                                      // (_refrenceWay.text.isEmpty ||
                                      //         _refrenceDate.text.isEmpty)
                                      //     ? Colors.grey
                                      //     :
                                      Color.fromRGBO(40, 75, 42, 1),
                                  onPressed: (con) {
                                    // if (_refrenceWay.text.isEmpty ||
                                    //     _refrenceDate.text.isEmpty) {
                                    // } else {
                                    insertScheduleData(con).then((value) {
                                      if (result["message"] ==
                                          "فرم با موفقیت ثبت شد.") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarSuccess);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBarfail);
                                      }
                                    });
                                    // }
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
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Container(
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
                        Icons.add,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeTableItems {
  int? id;
  String? start;
  String? title;
  String? end;

  TimeTableItems(
      {required this.id,
      required this.start,
      required this.title,
      required this.end});
}
