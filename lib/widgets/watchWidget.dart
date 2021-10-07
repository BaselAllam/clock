import 'package:flutter/material.dart';
import 'package:watch/theme/sharedColorAndFont.dart';




class WatchWidget extends StatefulWidget {

  @override
  _WatchWidgetState createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget> {

bool isAdded = false;

bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://ae01.alicdn.com/kf/H77cdd4f1b4d44afcb3b07b975066f3bdy/2020-Minimalist-Men-s-Fashion-Ultra-Thin-Watches-Simple-Men-Business-Stainless-Steel-Mesh-Belt-Quartz.jpg'),
                fit: BoxFit.fill
              )
            ),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(isFav == false ? Icons.favorite_border : Icons.favorite),
              color: Colors.red,
              iconSize: 20.0,
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              }
            ),
          ),
          ListTile(
            title: Text('New Brand', style: primarySubTextStyle),
            subtitle: Text('\$200', style: secondaryTextStyle),
            trailing: IconButton(
              icon: Icon(isAdded == false ? Icons.add_circle_outline_sharp : Icons.done),
              color: primaryColor,
              iconSize: 20.0,
              onPressed: () {
                setState(() {
                  isAdded = !isAdded;
                });
              }
            ),
          ),
        ],
      ),
    );
  }
}