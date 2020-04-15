import 'package:carousel_pro/carousel_pro.dart';
import 'package:clube_da_obra/models/Ad.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {

  PostScreen(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicação'),
        elevation: 4,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 240,
            child: Carousel(
              images: ad.images.map((f){
                return FileImage(f);
              }).toList(),
              dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: Colors.deepOrange[700],
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                /*MainPanel(ad),*/
                /*Divider(),
                DescriptionPanel(ad),
                Divider(),
                LocationPanel(ad),*/
              ],
            ),

          )
        ],
      ),
    );
  }
}
