import 'package:flutter/material.dart';
import 'package:watch/theme/sharedColorAndFont.dart';
import 'package:watch/widgets/watchWidget.dart';




class SearchResult extends StatefulWidget {

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primaryColor, size: 25.0),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {}
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return WatchWidget();
        },
      )
    );
  }
}