import "dart:async";
import "dart:convert";
import "dart:io";

import "package:cached_network_image/cached_network_image.dart";
import "package:data_table_2/data_table_2.dart";
import "package:dio/dio.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_ipa_export/components/globals.dart";
import "package:flutter_ipa_export/components/progress_button.dart";
import "package:persian_datetime_picker/persian_datetime_picker.dart";

class FinanceScreen extends StatefulWidget {
  final String id;
  final dynamic data;

  const FinanceScreen({super.key, required this.id, required this.data});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  List<Payments> payments = [
    // Payments(
    //     id: 1,
    //     title: "ورودی مهمان ها",
    //     amount: "20000000",
    //     accountOwner: "امیر رضا دانشور",
    //     date: "2024-10-20",
    //     method: "کارت به کارت"),
  ];
  final TextEditingController _title = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _accountOwner = TextEditingController();
  final TextEditingController _method = TextEditingController();
  String _pic = "";

  String selectedDate = Jalali.now().toJalaliDateTime();
  String label = 'تاریخ را انتخاب کنید';
  FilePickerResult? fileResult;
  late Uint8List conImage;

  bool flowerCon = false;
  bool designCon = false;
  bool contractCon = false;
  bool checkListCon = false;

  var result;

  var _timer;

  Map _schedule = {};

  final TextEditingController _total = TextEditingController();
  final TextEditingController _discount = TextEditingController();
  final TextEditingController _contractNumber = TextEditingController();
  final TextEditingController _contractDate = TextEditingController();
  final TextEditingController _detail = TextEditingController();

  Future insertFinanceData(
    AnimationController controller,
  ) async {
    String evDate = "";

    if (_contractDate.text.isNotEmpty && _contractDate.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_contractDate.text.split("/")[0]),
              int.parse(_contractDate.text.split("/")[1]),
              int.parse(_contractDate.text.split("/")[2])))
          .toDateTime();
      evDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    controller.forward();
    String fileName = "";
    if (_pic.isEmpty) {
      fileName = File(fileResult!.files.single.path!).path.split('/').last;
    } else {}
    int payed = 0;
    for (var i in payments) {
      payed += int.parse(i.amount!);
    }
    FormData formData = FormData.fromMap({
      "contract": _pic.isEmpty
          ? await MultipartFile.fromFile(
              File(fileResult!.files.single.path!).path,
              filename: fileName,
            )
          : _pic,
      "project_id": widget.id,
      "total": _total.text,
      "discount": _discount.text,
      "payed": payed,
      "contract_date": evDate,
      "contract_number": _contractNumber.text,
      "detail": _detail.text,
    });
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response = await dio.post(
          "https://pelakhaftapp.shop/api/insertfinance",
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

  Future insertPaymentsData(AnimationController controller) async {
    controller.forward();

    Dio dio = Dio();

    for (var i in payments) {
      var mi = {
        i.id.toString(): {
          "pt": i.title,
          "pa": i.amount,
          "pd": i.date,
          "po": i.accountOwner,
          "pm": i.method,
        }
      };
      _schedule.addAll(mi);
    }
    int payed = 0;
    for (var i in payments) {
      payed += int.parse(i.amount!);
    }
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertpayment",
              data: {
                "project_id": widget.id,
                "items": _schedule,
                "payed": payed,
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
    if (widget.data["finance"] != null) {
      _total.text = (widget.data["finance"]["total"] ?? "").toString();
      _discount.text = (widget.data["finance"]["discount"] ?? "").toString();
      _contractDate.text = widget.data["finance"]["contract_date"] ?? "";
      _contractNumber.text =
          (widget.data["finance"]["contract_number"] ?? "").toString();
      _detail.text = widget.data["finance"]["detail"] ?? "";
      _pic = widget.data["finance"]["contract"] ?? "";
    }
    if (widget.data["payments"] != null &&
        widget.data["payments"].isNotEmpty &&
        widget.data["finance"] != null) {
      payments = [];
      for (int i = 0; i < widget.data["payments"].length; i++) {
        payments.add(Payments(
            id: i + 1,
            title: widget.data["payments"][i]["title"],
            amount: (widget.data["payments"][i]["amount"]).toString(),
            date: widget.data["payments"][i]["date"],
            accountOwner: widget.data["payments"][i]["account_owner"],
            method: widget.data["payments"][i]["method"]));
      }
      print(payments.toString());
    }
    if (mounted) {
      _timer = Timer.periodic(
          Duration(milliseconds: 1000), (Timer t) => setState(() {}));
    }
    super.initState();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
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
                    "مالی و پرداختی",
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
                    contractCon = !contractCon;
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
                          "قرارداد",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          contractCon
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: Color.fromRGBO(40, 75, 42, 1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              if (contractCon)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "کل مبلغ :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (e) {},
                                      controller: _total,
                                      decoration: const InputDecoration(
                                          prefixIconColor: Color.fromARGB(
                                              255, 180, 180, 180),
                                          filled: true,
                                          fillColor:
                                              Color.fromRGBO(243, 243, 243, 1),
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "تخفیف :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (e) {},
                                      controller: _discount,
                                      decoration: const InputDecoration(
                                          prefixIconColor: Color.fromARGB(
                                              255, 180, 180, 180),
                                          filled: true,
                                          fillColor:
                                              Color.fromRGBO(243, 243, 243, 1),
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "تاریخ قرارداد :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (e) {},
                                      controller: _contractDate,
                                      decoration: const InputDecoration(
                                          prefixIconColor: Color.fromARGB(
                                              255, 180, 180, 180),
                                          filled: true,
                                          fillColor:
                                              Color.fromRGBO(243, 243, 243, 1),
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "شماره قرارداد :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.7,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      onChanged: (e) {},
                                      controller: _contractNumber,
                                      decoration: const InputDecoration(
                                          prefixIconColor: Color.fromARGB(
                                              255, 180, 180, 180),
                                          filled: true,
                                          fillColor:
                                              Color.fromRGBO(243, 243, 243, 1),
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "عکس قرارداد :",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: InkWell(
                              onTap: () async {
                                fileResult =
                                    await FilePicker.platform.pickFiles();
                                if (fileResult == null) {
                                  print("No file selected");
                                } else {
                                  conImage = await fileResult!.files[0].xFile
                                      .readAsBytes();
                                  setState(() {
                                    _pic = "";
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 238, 238),
                                    borderRadius: BorderRadius.circular(6)),
                                child: ((fileResult?.files.length == null ||
                                            fileResult?.files.length == 0) &&
                                        _pic == "")
                                    ? Padding(
                                        padding: const EdgeInsets.all(80.0),
                                        child: Center(
                                          child: Text(
                                            "Picture",
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: Color.fromRGBO(
                                                    91, 91, 91, 1)),
                                          ),
                                        ),
                                      )
                                    : Stack(children: [
                                        _pic == ""
                                            ? Image.memory(conImage)
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    "https://pelakhaftapp.shop/storage/files/financeContract/$_pic",
                                                placeholder: (context, url) =>
                                                    Opacity(
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
                                                fileResult = null;
                                                conImage = Uint8List(0);
                                                _pic = "";
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
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
                              color: (_total.text.isEmpty ||
                                      _discount.text.isEmpty)
                                  ? Colors.grey
                                  : Color.fromRGBO(40, 75, 42, 1),
                              onPressed: (con) {
                                if (_total.text.isEmpty ||
                                    _discount.text.isEmpty) {
                                } else {
                                  insertFinanceData(con).then((value) {
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
                          "پرداختی ها",
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
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 228, 228, 228),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DataTable2(
                                columnSpacing: 30,
                                horizontalMargin: 20,
                                minWidth: 600,
                                columns: [
                                  DataColumn(
                                    label: Text('عنوان'),
                                    headingRowAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                  DataColumn(
                                    label: Text('مبلغ'),
                                    headingRowAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                  DataColumn(
                                    label: Text('تاریخ'),
                                    headingRowAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                  DataColumn(
                                    label: Text('صاحب حساب'),
                                    headingRowAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                  DataColumn(
                                    label: Text("روش پرداخت"),
                                    headingRowAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                ],
                                rows: [
                                  for (var i in payments)
                                    DataRow(cells: [
                                      DataCell(Text(i.title!)),
                                      DataCell(Text(i.amount!.addSeparator(
                                          qty: 3, separator: ","))),
                                      DataCell(Text(Jalali.fromGregorian(
                                              Gregorian(
                                                  int.parse(
                                                      i.date!.split("-")[0]),
                                                  int.parse(
                                                      i.date!.split("-")[1]),
                                                  int.parse(
                                                      i.date!.split("-")[2])))
                                          .toJalaliDateTime()
                                          .split(" ")[0]
                                          .toString()
                                          .replaceAll(r'-', '/'))),
                                      DataCell(Text(i.accountOwner!)),
                                      DataCell(Text(i.method!)),
                                    ])
                                ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProgressButton(
                                  borderRadius: BorderRadius.circular(6),
                                  strokeWidth: 3,
                                  progressIndicatorSize: 20,
                                  color:
                                      // (_fruits.text.isEmpty && _pastry.text.isEmpty)
                                      //     ? Colors.grey
                                      //     :
                                      Color.fromRGBO(40, 75, 42, 1),
                                  onPressed: (con) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                            builder: (context, setState) {
                                          return AlertDialog(
                                              scrollable: true,
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
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
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "عنوان واریزی :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        height: 45,
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          onChanged: (e) {
                                                            setState(
                                                              () {},
                                                            );
                                                          },
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
                                                                  fillColor:
                                                                      Color.fromRGBO(
                                                                          243,
                                                                          243,
                                                                          243,
                                                                          1),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            5,
                                                                        color: Colors
                                                                            .transparent), //<-- SEE HERE
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
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
                                                                  hintText: "",
                                                                  suffixIcon:
                                                                      Icon(Icons
                                                                          .edit_outlined)),
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "تاریخ واریزی :",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    3.5,
                                                                height: 45,
                                                                child:
                                                                    TextFormField(
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11),
                                                                  onChanged:
                                                                      (e) {
                                                                    setState(
                                                                      () {},
                                                                    );
                                                                  },
                                                                  controller:
                                                                      _date,
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
                                                                            borderSide:
                                                                                BorderSide(width: 5, color: Colors.transparent), //<-- SEE HERE
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0)),
                                                                            borderSide:
                                                                                BorderSide(width: 2, color: Colors.transparent), //<-- SEE HERE
                                                                          ),
                                                                          focusColor: Color.fromARGB(
                                                                              255,
                                                                              180,
                                                                              180,
                                                                              180),
                                                                          labelText:
                                                                              "",
                                                                          hintText:
                                                                              "",
                                                                          suffixIcon:
                                                                              Icon(Icons.edit_outlined)),
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "مبلغ واریزی :",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    3.5,
                                                                height: 45,
                                                                child:
                                                                    TextFormField(
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11),
                                                                  onChanged:
                                                                      (e) {
                                                                    setState(
                                                                      () {},
                                                                    );
                                                                  },
                                                                  controller:
                                                                      _amount,
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
                                                                            borderSide:
                                                                                BorderSide(width: 5, color: Colors.transparent), //<-- SEE HERE
                                                                          ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0)),
                                                                            borderSide:
                                                                                BorderSide(width: 2, color: Colors.transparent), //<-- SEE HERE
                                                                          ),
                                                                          focusColor: Color.fromARGB(
                                                                              255,
                                                                              180,
                                                                              180,
                                                                              180),
                                                                          labelText:
                                                                              "",
                                                                          hintText:
                                                                              "",
                                                                          suffixIcon:
                                                                              Icon(Icons.edit_outlined)),
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
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        "صاحب حساب :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      // InkWell(
                                                      //   onTap: () async {
                                                      //     Jalali? picked =
                                                      //         await showPersianDatePicker(
                                                      //             context:
                                                      //                 context,
                                                      //             initialDate:
                                                      //                 Jalali
                                                      //                     .now(),
                                                      //             firstDate:
                                                      //                 Jalali(
                                                      //                     1385,
                                                      //                     8),
                                                      //             lastDate: Jalali(
                                                      //                 1450, 9),
                                                      //             initialEntryMode:
                                                      //                 PDatePickerEntryMode
                                                      //                     .calendarOnly,
                                                      //             initialDatePickerMode:
                                                      //                 PDatePickerMode
                                                      //                     .year,
                                                      //             builder:
                                                      //                 (context,
                                                      //                     child) {
                                                      //               return Theme(
                                                      //                 data:
                                                      //                     ThemeData(
                                                      //                   dialogTheme:
                                                      //                       const DialogTheme(
                                                      //                     shape:
                                                      //                         RoundedRectangleBorder(
                                                      //                       borderRadius:
                                                      //                           BorderRadius.all(Radius.circular(0)),
                                                      //                     ),
                                                      //                   ),
                                                      //                 ),
                                                      //                 child:
                                                      //                     child!,
                                                      //               );
                                                      //             });
                                                      //     if (picked != null &&
                                                      //         picked !=
                                                      //             selectedDate) {
                                                      //       setState(() {
                                                      //         label = picked
                                                      //             .toJalaliDateTime();
                                                      //       });
                                                      //     }
                                                      //   },
                                                      //   child: Container(
                                                      //       width: MediaQuery.of(
                                                      //                   context)
                                                      //               .size
                                                      //               .width /
                                                      //           2,
                                                      //       decoration: BoxDecoration(
                                                      //           color: const Color
                                                      //               .fromRGBO(
                                                      //               243,
                                                      //               243,
                                                      //               243,
                                                      //               1),
                                                      //           borderRadius:
                                                      //               BorderRadius
                                                      //                   .circular(
                                                      //                       6)),
                                                      //       child: Padding(
                                                      //         padding:
                                                      //             const EdgeInsets
                                                      //                 .all(8.0),
                                                      //         child: Row(
                                                      //           mainAxisAlignment:
                                                      //               MainAxisAlignment
                                                      //                   .spaceBetween,
                                                      //           children: [
                                                      //             SizedBox(
                                                      //               width: 5,
                                                      //             ),
                                                      //             Text(label),
                                                      //             Icon(Icons
                                                      //                 .edit_outlined),
                                                      //             SizedBox(
                                                      //               width: 5,
                                                      //             )
                                                      //           ],
                                                      //         ),
                                                      //       )),
                                                      // ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        height: 45,
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          onChanged: (e) {
                                                            setState(
                                                              () {},
                                                            );
                                                          },
                                                          controller:
                                                              _accountOwner,
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
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            5,
                                                                        color: Colors
                                                                            .transparent), //<-- SEE HERE
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
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
                                                                  hintText: "",
                                                                  suffixIcon:
                                                                      Icon(Icons
                                                                          .edit_outlined)),
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        "روش واریزی :",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2,
                                                        height: 45,
                                                        child: TextFormField(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          onChanged: (e) {
                                                            setState(
                                                              () {},
                                                            );
                                                          },
                                                          controller: _method,
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
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            5,
                                                                        color: Colors
                                                                            .transparent), //<-- SEE HERE
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)),
                                                                    borderSide: BorderSide(
                                                                        width:
                                                                            2,
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
                                                                  hintText: "",
                                                                  suffixIcon:
                                                                      Icon(Icons
                                                                          .edit_outlined)),
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            String evDate = "";

                                                            if (_date.text
                                                                    .isNotEmpty &&
                                                                _date.text
                                                                        .length >=
                                                                    8) {
                                                              var gore = Gregorian.fromJalali(Jalali(
                                                                      int.parse(
                                                                          _date.text.split("/")[
                                                                              0]),
                                                                      int.parse(
                                                                          _date.text.split("/")[
                                                                              1]),
                                                                      int.parse(_date
                                                                          .text
                                                                          .split(
                                                                              "/")[2])))
                                                                  .toDateTime();
                                                              evDate =
                                                                  "${gore.year}-${gore.month}-${gore.day}";
                                                            }
                                                            payments
                                                                .add(Payments(
                                                              id: payments
                                                                      .isNotEmpty
                                                                  ? payments
                                                                          .last
                                                                          .id! +
                                                                      1
                                                                  : 1,
                                                              title:
                                                                  _title.text,
                                                              accountOwner:
                                                                  _accountOwner
                                                                      .text,
                                                              date: evDate,
                                                              amount:
                                                                  _amount.text,
                                                              method:
                                                                  _method.text,
                                                            ));
                                                          });
                                                          Navigator.of(context)
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
                                                            padding:
                                                                const EdgeInsets
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
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        });
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      "افزودن",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              ProgressButton(
                                  borderRadius: BorderRadius.circular(6),
                                  strokeWidth: 3,
                                  progressIndicatorSize: 20,
                                  color: (payments.isEmpty)
                                      ? Colors.grey
                                      : Color.fromRGBO(40, 75, 42, 1),
                                  onPressed: (con) {
                                    if (payments.isEmpty) {
                                    } else {
                                      insertPaymentsData(con).then((value) {
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
                                      "ثبت نهایی",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.8,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
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
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.8,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
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
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                              padding:
                                                  const EdgeInsets.all(2.0),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                            color:
                                                Color.fromRGBO(40, 75, 42, 1),
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
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.8,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 243, 243, 1),
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
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
            ],
          ),
        ),
      ),
    );
  }
}

extension SubString on String {
  String addSeparator({int? qty = 3, String? separator = ","}) {
    assert(qty! >= 1, "[qty] value as the number separator must be positive!");
    assert(separator! != "",
        "[separator] value as the number separator must not be empty!");

    String tempNum = this;
    String sign = "";
    String decimal = "";

    if (RegExp(r'^[-+]?[0-9](\d+\.?\d*|\.\d+)').hasMatch(this)) {
      if (this[0] == "+" || this[0] == "-") {
        sign = this[0];
        tempNum = this.substring(1);
      }
      if (tempNum.contains(".")) {
        decimal = "." + tempNum.split(".")[1];
        tempNum = tempNum.split(".")[0];
      }
    }

    return sign +
        (tempNum
            .split('')
            .reversed
            .join()
            .replaceAllMapped(
                RegExp(r'(.{})(?!$)'.replaceAll('''{}''', '''{$qty}''')),
                (m) => '${m[0]}${separator}')
            .split('')
            .reversed
            .join()) +
        decimal;
  }
}

class Payments {
  int? id;
  String? title;
  String? amount;
  String? date;
  String? accountOwner;
  String? method;

  Payments(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.accountOwner,
      required this.method});
}
