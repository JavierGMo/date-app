import 'package:flutter/material.dart';


class LoadingIndicator extends StatelessWidget {
  final double height, width;
  const LoadingIndicator({this.height, this.width});



  //margin: EdgeInsets.only(top: size.height*0.5, left: size.width*0.45),
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height, left: width),
      child: CircularProgressIndicator()
    );
  }
}