import 'package:flutter/widgets.dart';
import 'package:gem/models/paragraph.dart';
import 'package:meta/meta.dart';

class Tip {
  final int id;
  final String title;
  final String time;
  final String subtitle;
  final String slug;
  final String image;
  final List<Paragraph> paragraphs;

  Tip({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.slug,
    @required this.image,
    @required this.time,
    @required this.paragraphs,
  });

  Tip.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        title = map['title'],
        subtitle = map['subtitle'],
        slug = map['slug'],
        image = map['image'],
        time = map['time'],
        paragraphs = map['paragraphs'] != null
            ? (map['paragraphs'] as List)
                .map((i) => Paragraph.fromMap(i))
                .toList()
            : null;
}
