import 'dart:io';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter_to_pdf/export_delegate.dart';
import 'package:flutter_to_pdf/export_frame.dart';
import 'package:flutter_to_pdf/options/checkbox_options.dart';
import 'package:flutter_to_pdf/options/export_options.dart';
import 'package:flutter_to_pdf/options/text_field_options.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ipa_export/components/globals.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final TextEditingController _title = TextEditingController();
  final ExportDelegate exportDelegate = ExportDelegate();
  Future<void> saveFile(document, String name) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/$name.pdf');

    await file.writeAsBytes(await document.save());
    debugPrint('Saved exported PDF at: ${file.path}');
  }

  String currentFrameId = 'questionaireDemo';
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
      // bottomSheet: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     TextButton(
      //       onPressed: () async {
      //         final ExportOptions overrideOptions = ExportOptions(
      //           textFieldOptions: TextFieldOptions.uniform(
      //             interactive: false,
      //           ),
      //           checkboxOptions: CheckboxOptions.uniform(
      //             interactive: false,
      //           ),
      //         );
      //         final pdf = await exportDelegate.exportToPdfDocument(
      //             currentFrameId,
      //             overrideOptions: overrideOptions);
      //         saveFile(pdf, 'static-example');
      //       },
      //       child: const Row(
      //         children: [
      //           Text('Export as static'),
      //           Icon(Icons.save_alt_outlined),
      //         ],
      //       ),
      //     ),
      //     TextButton(
      //       onPressed: () async {
      //         final pdf =
      //             await exportDelegate.exportToPdfDocument(currentFrameId);
      //         saveFile(pdf, 'interactive-example');
      //       },
      //       child: const Row(
      //         children: [
      //           Text('Export as interactive'),
      //           Icon(Icons.save_alt_outlined),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.transparent,
                  ),
                  const Text(
                    "آمار",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(40, 75, 42, 1)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(40, 75, 42, 1),
                      ),
                    ),
                  ),
                ],
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
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return AlertDialog(
                                      scrollable: true,
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
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
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
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
                                                    2,
                                                height: 45,
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
                                                          hintText: "",
                                                          suffixIcon: Icon(Icons
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
                                                "مبلغ واریزی :",
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
                                                    2,
                                                height: 45,
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
                                                          hintText: "",
                                                          suffixIcon: Icon(Icons
                                                              .edit_outlined)),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
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
                          onTap: () {},
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
                        SizedBox(
                          width: 30,
                        ),
                      ],
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
                                text: "5 ",
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
                                        "12",
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
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExportFrame(
                  frameId: 'questionaireDemo',
                  exportDelegate: exportDelegate,
                  child: DataTable2(
                      columnSpacing: 30,
                      horizontalMargin: 20,
                      minWidth: 900,
                      columns: [
                        DataColumn(
                            label: Text('نوع مراسم'),
                            headingRowAlignment: MainAxisAlignment.center),
                        DataColumn(
                          label: Text('تاریخ'),
                        ),
                        DataColumn(
                          label: Text('تعداد نفرات'),
                        ),
                        DataColumn(
                          label: Text('میوه'),
                        ),
                        DataColumn(
                          label: Text('شیرینی'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('آبمیوه'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('چای'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('کیک'),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text('نان و پنیر'),
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          100,
                          (index) => DataRow(cells: [
                                DataCell(Text('A' * (10 - index % 10))),
                                DataCell(Text('B' * (10 - (index + 5) % 10))),
                                DataCell(Text('C' * (15 - (index + 5) % 10))),
                                DataCell(Text('D' * (15 - (index + 10) % 10))),
                                DataCell(
                                    Text(((index + 0.1) * 25.4).toString())),
                                DataCell(Text('D' * (15 - (index + 10) % 10))),
                                DataCell(Text('D' * (15 - (index + 10) % 10))),
                                DataCell(Text('D' * (15 - (index + 10) % 10))),
                                DataCell(Text('D' * (15 - (index + 10) % 10))),
                              ]))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  final ExportOptions overrideOptions = ExportOptions(
                    textFieldOptions: TextFieldOptions.uniform(
                      interactive: false,
                    ),
                    checkboxOptions: CheckboxOptions.uniform(
                      interactive: false,
                    ),
                  );
                  final pdf = await exportDelegate.exportToPdfDocument(
                      currentFrameId,
                      overrideOptions: overrideOptions);
                  saveFile(pdf, 'static-example');
                },
                child: Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 75, 42, 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        "دانلود",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
              SizedBox(
                height: 60,
              ),
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
