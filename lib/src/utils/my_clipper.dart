import 'package:flutter/material.dart' show CustomClipper, Path, Size, required;

class MyClipper extends CustomClipper<Path>{
  final double c10, c11, c20, c21, p1, p2;
  final bool flag;
  MyClipper({@required this.c10, @required this.c11, @required this.c20, @required this.c21, @required this.p1, @required this.p2, this.flag});
  @override
  Path getClip(Size size) {
      final path = Path();
      // print('c10 $c10 c11 $c11');
      path.lineTo(0.0, size.height);
      
      
      
      //Bezier
      // path.quadraticBezierTo(size.width-(size.width / 3.25), size.height-65.0, size.width, size.height-40.0 );
      // path.quadraticBezierTo(size.width-(size.width / 4.25), size.height, size.width/2.25, size.height - 30.0 );

      
      
      // path.quadraticBezierTo(size.width/4, size.height, size.width/2.25, size.height - 30.0 );
      // path.quadraticBezierTo(size.width-(size.width / 3.25), size.height-65.0, size.width, size.height-40.0 );
      //Cubic
      /*
        Cubic para formato ondulado
        path.cubicTo(100, size.height-200, size.width-100, size.height+100, size.width, size.height-50 );
       */
      if(this.flag){
        print('entre con el parametro');
        // path.cubicTo(this.c10, this.c11, this.c20, this.c21, this.p1, this.p2);
        path.cubicTo(size.width, size.height, size.width, size.height, size.width, size.height);
      }else{
        print('falso malo');
        path.cubicTo(100, size.height-200, size.width-100, size.height+100, size.width, size.height-50 );

      }
      
      // path.cubicTo(size.width, size.height, size.width, size.height, size.width, size.height );
      // path.cubicTo(this.c10, this.c11, this.c20, this.c21, this.p1, this.p2);


      path.lineTo(size.width, size.height-40.0);
      path.lineTo(size.width, 0.0);


      path.close();
      return path;
    }
  
    @override
    bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}