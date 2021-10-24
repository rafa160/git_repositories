import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_repositories/screens/splash/splash_module.dart';

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