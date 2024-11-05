import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class InsertProjectScreen extends StatefulWidget {
  const InsertProjectScreen({super.key});

  @override
  State<InsertProjectScreen> createState() => _InsertProjectScreenState();
}

class _InsertProjectScreenState extends State<InsertProjectScreen> {
  final TextEditingController _ownerName = TextEditingController();
  final TextEditingController _ownerphone = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _ownerId = TextEditingController();
  final TextEditingController _guestCount = TextEditingController();

  final TextEditingController _groomName = TextEditingController();
  final TextEditingController _groomPhone = TextEditingController();
  final TextEditingController _groomBirth = TextEditingController();
  final TextEditingController _groomJob = TextEditingController();

  final TextEditingController _brideName = TextEditingController();
  final TextEditingController _bridePhone = TextEditingController();
  final TextEditingController _brideBirth = TextEditingController();
  final TextEditingController _brideJob = TextEditingController();

  var result;

  SnackBar snackBarSuccess = SnackBar(
    content: Text('مراسم با موفقیت ثبت شد.'),
  );
  SnackBar snackBarfail = SnackBar(
    content: Text('مراسم ثبت نشد.'),
  );
  Future insertData(AnimationController controller, context) async {
    controller.forward();
    String evDate = "";
    String groomDate = "";
    String brideDate = "";

    if (_date.text.isNotEmpty && _date.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_date.text.split("/")[0]),
              int.parse(_date.text.split("/")[1]),
              int.parse(_date.text.split("/")[2])))
          .toDateTime();
      evDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    if (_groomBirth.text.isNotEmpty && _groomBirth.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_groomBirth.text.split("/")[0]),
              int.parse(_groomBirth.text.split("/")[1]),
              int.parse(_groomBirth.text.split("/")[2])))
          .toDateTime();
      groomDate = "${gore.year}-${gore.month}-${gore.day}";
    }

    if (_brideBirth.text.isNotEmpty && _brideBirth.text.length >= 8) {
      var gore = Gregorian.fromJalali(Jalali(
              int.parse(_brideBirth.text.split("/")[0]),
              int.parse(_brideBirth.text.split("/")[1]),
              int.parse(_brideBirth.text.split("/")[2])))
          .toDateTime();
      brideDate = "${gore.year}-${gore.month}-${gore.day}";
    }
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/insertproject",
              data: {
                "owner_name": _ownerName.text,
                "owner_phone": _ownerphone.text,
                "owner_melli_code": _ownerId.text,
                "title": _title.text,
                "guest_count": _guestCount.text,
                "event_date": evDate,
                "event_time": _time.text,
                "groom_name": _groomName.text,
                "groom_phone": _groomPhone.text,
                "groom_birthday": groomDate,
                "groom_job": _groomJob.text,
                "bride_name": _brideName.text,
                "bride_phone": _bridePhone.text,
                "bride_birthday": brideDate,
                "bride_job": _brideJob.text,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            result = json.decode(response.toString());
          });
          controller.reset();
          if (result["message"] == "پروژه با موفقیت ثبت شد.") {
            ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBarfail);
          }
          return result;
        }
      } else {
        if (kDebugMode) {}
        controller.reset();
        ScaffoldMessenger.of(context).showSnackBar(snackBarfail);
        return result;
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "صاحب مراسم :",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: (e) {},
              controller: _ownerName,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تاریخ برگزاری مراسم :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _date,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "نوع مراسم :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _title,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      "ساعت برگزاری مراسم :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _time,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "کد ملی صاحب مراسم :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _ownerId,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      "تعداد نفرات :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _guestCount,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شماره تماس :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _ownerphone,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "اطلاعات داماد :",
              style: TextStyle(
                  color: Color.fromRGBO(40, 75, 42, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "نام و نام خانوادگی :",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: (e) {},
              controller: _groomName,
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
              "شماره تماس :",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: (e) {},
              controller: _groomPhone,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تاریخ تولد :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _groomBirth,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شغل :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _groomJob,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "اطلاعات عروس :",
              style: TextStyle(
                  color: Color.fromRGBO(40, 75, 42, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "نام و نام خانوادگی :",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: (e) {},
              controller: _brideName,
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
              "شماره تماس :",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: (e) {},
              controller: _bridePhone,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "تاریخ تولد :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _brideBirth,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "شغل :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        onChanged: (e) {},
                        controller: _brideJob,
                        decoration: const InputDecoration(
                            prefixIconColor: Color.fromARGB(255, 180, 180, 180),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Text(
            //   "بخش مالی پروژه :",
            //   style: TextStyle(
            //       color: Color.fromRGBO(40, 75, 42, 1),
            //       fontSize: 17,
            //       fontWeight: FontWeight.bold),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //             color: Color.fromARGB(255, 226, 226, 226),
            //             blurRadius: 5)
            //       ],
            //       borderRadius: BorderRadius.circular(5)),
            //   child: const Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "آپلود قرارداد امضا شده",
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Icon(
            //           Icons.arrow_forward_ios_outlined,
            //           color: Color.fromRGBO(40, 75, 42, 1),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            ProgressButton(
                borderRadius: BorderRadius.circular(6),
                strokeWidth: 3,
                progressIndicatorSize: 20,
                color: (_ownerName.text.isEmpty ||
                        _ownerphone.text.isEmpty ||
                        _ownerId.text.isEmpty ||
                        _title.text.isEmpty ||
                        _guestCount.text.isEmpty ||
                        _date.text.isEmpty ||
                        _time.text.isEmpty)
                    ? Colors.grey
                    : Color.fromRGBO(40, 75, 42, 1),
                onPressed: (con) {
                  if (_ownerName.text.isEmpty ||
                      _ownerphone.text.isEmpty ||
                      _ownerId.text.isEmpty ||
                      _title.text.isEmpty ||
                      _guestCount.text.isEmpty ||
                      _date.text.isEmpty ||
                      _time.text.isEmpty) {
                  } else {
                    insertData(con, context);
                  }
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
            SizedBox(
              height: 100,
            )
          ]),
        ),
      ),
    );
  }
}
