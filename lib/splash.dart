import 'package:flutter/material.dart';
import 'package:flutter_ipa_export/auth.dart';
import 'package:flutter_ipa_export/components/globals.dart';
import 'package:flutter_ipa_export/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _islogedin = false;
  String _nicName = "";

  Future<void> _cache() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _islogedin = prefs.getBool("islogedin") ?? false;
      if (_islogedin) {
        _nicName = prefs.getString('nic_name') ?? "";
        userId = prefs.getString('user_id') ?? "";
        role = prefs.getString('role') ?? "";
        surName = _nicName;
      }
    });
    Future.delayed(Duration(milliseconds: 2000), (() {
      setState(() {
        opacity = 1;
      });
    })).then((value) {
      if (_islogedin) {
        Future.delayed(Duration(milliseconds: 2000), (() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LayoutScreen()));
        }));
      } else {
        Future.delayed(Duration(milliseconds: 2000), (() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AuthScreen()));
        }));
      }
    });
  }

  double opacity = 0;
  @override
  void initState() {
    super.initState();
    _cache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/splash/background.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/general/logo.png",
                  width: MediaQuery.of(context).size.width,
                  scale: .7,
                ),
                Text(
                  "پنل مدیریت مراسمات",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
