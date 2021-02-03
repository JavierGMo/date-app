import 'package:flutter/material.dart';
class RaisedBtnCustom extends StatelessWidget {
  final String textButton;
  final Function onPress;
  final double heightBtn;
  final double widthBtn;
  final Color colorBtn;
  final Color colorTextBtn;
  final double elevation;
  final Widget iconBtn;
  
  final double sizeBtwnIconAndText;
  const RaisedBtnCustom({
    @required this.textButton,
    @required this.heightBtn,
    @required this.widthBtn,
    @required this.colorBtn,
    @required this.colorTextBtn,
    @required this.elevation,
    @required this.iconBtn,
    
    @required this.sizeBtwnIconAndText,
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightBtn,
      width: widthBtn,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        color: colorBtn,
        textColor: colorTextBtn,
        elevation: elevation,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconBtn,
              SizedBox(width: sizeBtwnIconAndText,),
              Text(
                textButton,
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
            ],
          ),
        ),
        onPressed: onPress
      ),
    );
  }
}