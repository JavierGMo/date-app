
import 'package:flutter/material.dart';
import 'package:dateapp/src/widgets/post.dart';


class PostList extends StatelessWidget {
  
  final Map<int, List<String>> posts;

  const PostList({@required this.posts});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i){
        return Container(
          height: size.height*0.3,
          margin: EdgeInsets.only(bottom: 35.0),
          child: Post(title: '${posts[i][0]}-$i', subtitle: '${posts[i][1]}'),
        );
      }
    );
  }
}