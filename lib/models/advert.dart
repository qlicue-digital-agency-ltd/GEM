import 'package:flutter/material.dart';

class Advert {
  final int id;
  final String title;
  final String link;
  final String desc;
  final String image;

  Advert({
    @required this.id,
    @required this.title,
    @required this.link,
    @required this.desc,
    @required this.image,
  });

  Advert.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        title = map['title'],
        link = map['link'],
        desc = map['desc'],
        image = map['image'];
}
