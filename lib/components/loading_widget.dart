import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitChasingDots(
      color: Colors.black,
      size: 30.0,
    ));
  }
}