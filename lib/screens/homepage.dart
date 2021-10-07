import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:watch/models/controller.dart';
import 'package:watch/screens/searchResult.dart';
import 'package:watch/theme/sharedColorAndFont.dart';
import 'package:watch/widgets/categoryWidget.dart';
import 'package:watch/widgets/watchWidget.dart';




class HomePage extends StatefulWidget {

  final AppController controller;

  HomePage(this.controller);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    widget.controller.getData();
    super.initState();
  }

List<Map<String, dynamic>> categoryData = [
  {
    'img' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3evUSz1rPfCN7-3icvxMjvtsVe3Xjn-jFish0rLTzxL7y_at6FP7r0_pX7TwCueNMTHE&usqp=CAU',
    'txt' : 'Hand Watch'
  },
  {
    'img' : 'https://cdn.webshopapp.com/shops/15195/files/5569171/900x660x2/wall-clock-riki.jpg',
    'txt' : 'Home Watch'
  },
  {
    'img' : 'https://sc04.alicdn.com/kf/HTB1miCkXzLuK1Rjy0Fhq6xpdFXat.jpg',
    'txt' : 'Women Watch'
  },
  {
    'img' : 'https://ae01.alicdn.com/kf/HTB1tUUUaUGF3KVjSZFoq6zmpFXaq/KDM-2019-New-Cute-Cartoon-Dinosaur-Child-Watch-Genuine-Leather-Kids-Boys-Watches-Kid-Children-Wristwatch.jpg',
    'txt' : 'Child Watch'
  },
  {
    'img' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6n3NzZ99saFuLIdlpX3i5zzNPspzyu7eIUm3Uh3N3xvWvYvaZl5ySa59ijF-M2QeYjWY&usqp=CAU',
    'txt' : 'Sport Watch'
  },
];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, AppController controller) {
        return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primaryColor, size: 25.0),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {return SearchResult();}));
              }
            ),
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {}
            ),
          ],
        ),
        drawer: Drawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr2IjPw31-uXtrx4lLM83CqeawbjAnONbPEZYrkSZKjjqKA6BCm7a50T9C80tYsslhQEY&usqp=CAU'),
                  fit: BoxFit.fill
                )
              ),
            ),
            Container(
              height: 125.0,
              margin: EdgeInsets.only(bottom: 10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.allCategories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    controller.allCategories[index].categoryImage,
                    controller.allCategories[index].categoryName
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: secondaryColor,
                  height: 2.0,
                  width: 80.0
                ),
                Column(
                  children: [
                    Text(
                      'New\nCollection',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle
                    ),
                    Text(
                      'Discover new Watches', style: secondaryTextStyle
                    ),
                  ],
                ),
                Container(
                  color: secondaryColor,
                  height: 2.0,
                  width: 80.0
                ),
              ],
            ),
            for(int i = 0; i < 5; i++)
            WatchWidget()
          ],
        ),
      );
      }
    );
  }
}