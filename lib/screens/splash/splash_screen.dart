import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_repositories/components/custom_animated_widget.dart';
import 'package:git_repositories/screens/home/home_module.dart';
import 'package:git_repositories/style/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.grey[200],
            ],
          ),
        ),
        child: Center(
          child: CustomAnimatedWidget(
              milliseconds: 1000,
              horizontalOffset: 240,
              position: 1,
              widget: Text('GitHub Repositories', style: name,)),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) {
      Get.offAll(() => HomeModule());
    });
  }
}