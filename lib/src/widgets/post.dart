import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  
  final String title, subtitle;
  const Post({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('$title'),
            subtitle: Text('$subtitle'),
          ),
          Container(
            margin: EdgeInsets.only(top: 75.0),
            alignment: AlignmentDirectional.bottomEnd,
            child: FlatButton.icon(
              icon: Icon(Icons.arrow_right_alt),
              label: Container(),
              onPressed: (){
                print('Text');
              }
            ),
          ),
        ],
      ),
    );
  }
}