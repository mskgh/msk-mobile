import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Auth/login arena/login_center.dart';
import 'Auth/login arena/login_screen_phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const LoginScreen());
      // Navigator.push(
      //     context, MaterialPageRoute(
      //     builder: (context)=>const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.only(bottom: size * 0.1),
        height: size * 0.4,
        width: size * 0.4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mskgifNew.gif'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
      )),
    );
  }
}
