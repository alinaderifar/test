import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/components/progress_button.dart';
import 'package:flutter_ipa_export/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneNum = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var result;
  Future<void> _loadcache(nicName, userName, phoneNum, _role) async {
    final prefs = await SharedPreferences.getInstance();
    if (_role == "1") {
      _role = "مدیر کل";
    } else if (_role == "2") {
      _role = "مشاور موزیک";
    } else if (_role == "3") {
      _role = "مشاور مالی";
    } else if (_role == "4") {
      _role = "مشاور پذیرایی";
    } else if (_role == "5") {
      _role = "مشاور دیزاین";
    } else if (_role == "3,4") {
      _role = "مشاور پذیرایی/مالی";
    }
    prefs.setBool('islogedin', true);
    prefs.setString('nic_name', nicName);
    prefs.setString('user_id', userName);
    prefs.setString('phone_num', phoneNum);
    prefs.setString('role', _role);

    setState(() {
      surName = nicName;
      role = _role;
      userId = userName.toString();
    });
  }

  Future login(
      String phone, AnimationController controller, String password) async {
    controller.forward();
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["x-api-key"] =
        "piAmJCg7FCkK5wT5NC82ty77IRCYXQFoOvx8DkU5JIlxlXtlWT1uTG9qUJhhewklRRQKVSxhP2GX7j7khlZJd4g0Hm20GmHiaWr2oHFzWhfNvFm2pi4f0AQNcvRCJE09";
    dio.options.contentType = Headers.formUrlEncodedContentType;
    try {
      Response response =
          await dio.post("https://pelakhaftapp.shop/api/loginUser",
              data: {
                "phone_num": phone,
                "password": password,
              },
              options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (mounted) {
          controller.reset();
          return result = json.decode(response.toString());
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

  double width = 180;
  double opacity = 0;
  bool rules = false;

  bool _cod = true;
  bool register = true;

  @override
  void initState() {
    super.initState();
    // apiCall(url);
    Future.delayed(Duration(milliseconds: 200), ((() {
      setState(() {
        width = MediaQuery.of(context).size.width;
        opacity = 1;
      });
    })));
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBarfail = SnackBar(
      content: Text('کد اشتباه است لطفاً دوباره سعی کنید.'),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset(
          "assets/splash/authBackground.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: -5,
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/general/logo.png",
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "پنل مدیریت مراسمات",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Design by Webarka",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 10,
              ),
            ),
          ),
        ),
        AnimatedContainer(
            width: width,
            duration: Duration(milliseconds: 600),
            child: AnimatedOpacity(
                opacity: opacity,
                duration: Duration(milliseconds: 400),
                child: AnimatedContainer(
                  alignment: Alignment.centerRight,
                  duration: const Duration(milliseconds: 500),
                  child: authScreen(_phoneNum, _password, ((controller) {
                    if (_phoneNum.text.isNotEmpty &&
                        _password.text.isNotEmpty) {
                      login(_phoneNum.text, controller, _password.text)
                          .then((value) {
                        setState(() {
                          result["message"] == "اطلاعات کاربری"
                              ? _loadcache(
                                  result["data"]["full_name"].toString(),
                                  result["data"]["id"].toString(),
                                  _phoneNum.text,
                                  result["data"]["role"].toString(),
                                ).then((e) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LayoutScreen()));
                                })
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarfail);

                          _cod = false;
                        });
                      });
                    }
                  }), onChanged: (e) {
                    setState(() {
                      e = e;
                    });
                  }),
                )))
      ]),
    );
  }
}

Widget authScreen(TextEditingController con1, TextEditingController con2,
    Function(AnimationController con) pressed,
    {void Function(String)? onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "برای احراز هویت نام کاربری و رمز عبور خود را وارد کنید.",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(40, 75, 42, 1)),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "شماره تلفن :",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              onChanged: onChanged,
              controller: con1,
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
                  prefixIcon: Icon(Icons.account_circle_rounded)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'لطفا نام کاربری خود را وارد کنید';
                }

                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "رمز عبور :",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.black),
              onChanged: onChanged,
              controller: con2,
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
                  prefixIcon: Icon(Icons.password)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'لطفا رمز خود را وارد کنید';
                }

                return null;
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ProgressButton(
          strokeWidth: 3,
          progressIndicatorSize: 20,
          onPressed: pressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
            child: Text(
              "ورود",
              style: TextStyle(
                  color: con1.text.isNotEmpty && con2.text.isNotEmpty
                      ? Colors.white
                      : Colors.grey),
            ),
          ),
          color: con1.text.isNotEmpty && con2.text.isNotEmpty
              ? Color.fromRGBO(40, 75, 42, 1)
              : Colors.grey[800]!,
          borderRadius: BorderRadius.circular(30),
        )
      ],
    ),
  );
}
