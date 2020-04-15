import 'package:carousel_pro/carousel_pro.dart';
import 'package:clube_da_obra/helpers/format_field.dart';
import 'package:clube_da_obra/models/Ad.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatefulWidget {
  const BlogTile(this.ad);

  final Ad ad;

  @override
  _BlogTileState createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Card(
              borderOnForeground: true,
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    ExpansionTile(
                      backgroundColor: Colors.transparent,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset('images/worker_icon.png',
                            fit: BoxFit.cover),
                      ),
                      title: Text('Barbara dias Paiva'),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          widget.ad.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                      children: <Widget>[
                        Text(
                          widget.ad.description,
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Carousel(
                              images: widget.ad.images.map((f) {
                                return FileImage(f);
                              }).toList(),
                              dotSize: 4,
                              dotSpacing: 15,
                              dotBgColor: Colors.transparent,
                              dotColor: Colors.greenAccent,
                              autoplay: false,
                            ),
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Image.asset(
                                  "images/share_icon.png",
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Positioned(
                              right: 45,
                              child: IconButton(
                                icon: Image.asset(
                                  "images/heart_transparent_icon.png",
                                  height: 20,
                                ),
                                splashColor: Colors.pink[100],
                                onPressed: () {},
                              ),
                            ),
                            Positioned(
                              right: 50,
                              bottom: 5,
                              child: Text(
                                "0",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(

                          alignment: Alignment.bottomLeft,

                          child: Text(
                            '${widget.ad.address.city}, ${widget.ad.address.federativeUnit}',
                            style:
                            TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Publicado : ${dateToString(widget.ad.dateCreated)}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ),

          ),
        ],
      ),
    );
  }
}
