import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Git Repositories',
      debugShowCheckedModeBanner: false,
      home: SplashModule(),
    );
  }
}