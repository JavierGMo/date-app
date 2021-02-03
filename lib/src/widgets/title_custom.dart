import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final String title;
  final AlignmentDirectional aligment;
  const TitleCustom({@required this.title, @required this.aligment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      // alignment: AlignmentDirectional.topCenter,
      // alignment: AlignmentDirectional.center,
      margin: EdgeInsets.only(top: 50.0, bottom: 0.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 45.0,
          color: Colors.white
        ),
      ),
    );
  }
}