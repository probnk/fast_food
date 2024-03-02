import 'dart:async';
import 'package:fast_food/Const/Colors.dart';
import 'package:fast_food/Widgets/Login/Login.dart';
import 'package:fast_food/Widgets/Splash_Screen/Splash_Animation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: ListView(
        children: [
          Image.asset("assets/images/app_logo.jpg"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            color:yellow,
            child: Container(
              margin: EdgeInsets.only(left: 100),
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Food Cafe",
                            style: main_heading
                        ),
                        TextSpan(
                            text: "\nHealthy & Tasty",
                            style: text
                        )
                      ]
                  )
              ),
            ),
          ),
          Container(
              color: yellow,
              child: SlideInScooter(controller: _controller)
          ),
          Container(
            height: 20,
            color: yellow,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}