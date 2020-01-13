import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Tip {
  final int id;
  final String title;
  final String time;
  final String subtitle;

  final String image;
  final List<int> adds;
  final List<dynamic> paragraphs;
  final String author;
  final bool likeStatus;

  Tip(
      {@required this.id,
      @required this.title,
      @required this.time,
      @required this.subtitle,
      @required this.image,
      @required this.likeStatus,
      @required this.adds,
      @required this.paragraphs,
      @required this.author});

  Tip.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        time = map['time'],
        subtitle = map['slug'],
        likeStatus = map['likeStatus'],
        author = map['author'],
        adds = map['adds'],
        image = map['image'],
        paragraphs = map['paragraphs'];
}
