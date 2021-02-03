import 'package:dateapp/src/widgets/loading_indicator.dart';
import 'package:dateapp/src/widgets/title_custom.dart';
import 'package:flutter/material.dart';

import 'package:dateapp/src/utils/my_clipper.dart';
import 'package:dateapp/src/widgets/field_form.dart';
import 'package:dateapp/src/widgets/raisedbtn_custom.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  //Usar streams para el valor del clipper
  AnimationController _controller;
  Animation _animation;
  double containerSize;
  double width, height;
  bool flag;
  bool progress;
  bool showLogin;
  BuildContext _contexto;
  AlignmentDirectional aligment;
  MyClipper myClipper;

  
  _LoginPageState(){
    this.containerSize = 0.4;
    this.flag = false; 
    this.progress = false;
    this.showLogin = false;
    this.aligment = AlignmentDirectional.topCenter;
  }

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 0.41, end: 1.0).animate(_controller);
    _controller.addStatusListener((AnimationStatus status) {
      final valueAnimation = double.parse((_animation.value).toStringAsFixed(2));
      if(valueAnimation == 1.0){
        // print('callback 0.9: $valueAnimation');
        print('Calbackkk......');
        flag = true;
        //Dar un nuevo valor al clipper declarando una variable al principio de esta clase
        setState(() {
          print('width $width');
          myClipper = MyClipper(c10: width, c11: height, c20: width, c21: height, p1: width, p2: height, flag: flag);
        });
        if(status == AnimationStatus.completed){
          print('Hola completado');
          Navigator.pushReplacementNamed(_contexto, 'home');
        }
      }
    });
    // _controller.addListener(() {
    //   final valueAnimation = double.parse((_animation.value).toStringAsFixed(2));
    //   if(valueAnimation == 1.0){
    //     // print('callback 0.9: $valueAnimation');
    //     print('Calbackkk......');
    //     flag = true;
    //     //Dar un nuevo valor al clipper declarando una variable al principio de esta clase
    //     setState(() {
    //       print('width $width');
    //       myClipper = MyClipper(c10: width, c11: height, c20: width, c21: height, p1: width, p2: height, flag: flag);
    //     });
    //   }
      
    // });
    // _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    _contexto = context;
    final size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // myClipper = MyClipper(c10: width, c11: height, c20: width, c21: height, p1: width, p2: height, flag: true);
    myClipper = MyClipper(
      c10: 100,
      c11: height-200,
      c20: width-100,
      c21: height+100,
      p1: width,
      p2: height-50,
      flag: flag,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              _backgroundDesign(size),
              showLogin?Container():_formLogin(size),
              progress?LoadingIndicator(height: height*0.5, width: width*0.45,):Container(),
            ],
          )
        ),
      ),
    );
  }

  Widget _backgroundDesign(Size size){
    return AnimatedBuilder(
      animation: CurvedAnimation(
        curve: Curves.bounceOut,
        parent: _controller
      ),
      builder: (_,wdg){
        return  ClipPath(
          child: Container(
            height: size.height*_animation.value,
            color: Colors.pinkAccent,
            child: TitleCustom(title: 'App Date', aligment: aligment,),
          ),
          clipper: myClipper,
        );
      },
    );
  }

  Widget _formLogin(Size size){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: size.height*0.19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 1.0,
            
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            ),
          ),
          SizedBox(height: 35.0,),
          FieldForm(
            obscureText: false,
            textInputType: TextInputType.emailAddress,
            icon: Icons.email,
            colorIcon: Colors.blueAccent,
            hintText: 'Email',
            errorText: '',
          ),
          SizedBox(height: 15.0,),
          FieldForm(
            obscureText: true,
            textInputType: TextInputType.text,
            icon: Icons.lock,
            colorIcon: Colors.blueAccent,
            hintText: 'Password',
            errorText: '',
          ),
          SizedBox(height: 17.0,),
          RaisedBtnCustom(
            textButton: 'Login',
            widthBtn: 290.0,
            heightBtn: 50.0,
            colorBtn: Colors.blueAccent,
            colorTextBtn: Colors.white,
            elevation: 0.0,
            iconBtn: Container(),
            sizeBtwnIconAndText: 10.0,
            onPress: () async{
              // print('Hola');
              // print('Valor chido : ${_animation.value}');
              // del();
              setState(() {
                progress = true;
              });
              await Future.delayed(const Duration(seconds: 5), (){
                print('Hola desde un delayed');
                setState(() {
                  progress = false;
                  showLogin = true;
                  containerSize = _animation.value;
                  _controller.forward();
                  aligment = AlignmentDirectional.center;
                });
              });
              // setState((){
                
              //   containerSize = _animation.value;
              //   _controller.forward();
              // });
            }
          ),
          SizedBox(height: 30.0,),
          RaisedBtnCustom(
            textButton: 'Continuar con Facebook',
            widthBtn: 290.0,
            heightBtn: 50.0,
            colorBtn: Colors.grey,
            colorTextBtn: Colors.white,
            elevation: 0.0,
            iconBtn: Icon(Icons.web),
            sizeBtwnIconAndText: 10.0,
            onPress: (){
              // print('Hola');
              setState(() {
                containerSize = 0.4;
                _controller.reverse();
              });
            }
          ),
          SizedBox(height: 27.0,),
        ],
      ),
    );
  }



  void del() async{
    print('adios desde un delayed');
    setState(() {
      progress = true;
    });
    await Future.delayed(const Duration(seconds: 5), (){
      print('Hola desde un delayed');
      setState(() {
        progress = false;
      });
    });

  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


}


