import 'package:flutter/material.dart';
import 'package:dateapp/src/utils/my_clipper.dart';
import 'package:dateapp/src/widgets/posts_list.dart';



class HomePage extends StatelessWidget {
  
  final listaPost = {
    0 : ['Titulo', 'Descripcion muy muy muy muy muy muy muy larga larga larga larga larga'],
    1 : ['Titulo', 'Descripcion muy muy muy muy muy muy muy larga larga larga larga larga'],
    2 : ['Titulo', 'Descripcion muy muy muy muy muy muy muy larga larga larga larga larga'],
    3 : ['Titulo', 'Descripcion muy muy muy muy muy muy muy larga larga larga larga larga'],
    4 : ['Titulo', 'Descripcion muy muy muy muy muy muy muy larga larga larga larga larga']
  };
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final myClipper = MyClipper(
      c10: 100,
      c11: size.height-200,
      c20: size.width-100,
      c21: size.height+100,
      p1: size.width,
      p2: size.height-50,
      flag: false,
    );



    return Scaffold(
      appBar: AppBar(
        
        title: Text('App date'),
        actions: <Widget>[
          Icon(Icons.search),
          SizedBox(width: 10.0,)
        ],
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              child: Container(
                height: size.height*0.4,
                color: Colors.pinkAccent,
              ),
              clipper: myClipper,
            ),
            Container(
              child: PostList(posts: listaPost),
            )
          ],
        ),
      ),
    );
  }
}