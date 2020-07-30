import 'package:gem/models/paragraph.dart';
import 'package:meta/meta.dart';

class Case {
  final int id;
  final String title;
  final String time;
  final String subtitle;
  final String slug;
  final String image;
  final List<Paragraph> paragraphs;

  Case({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.slug,
    @required this.image,
    @required this.time,
    @required this.paragraphs,
  });

  Case.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        title = map['title'],
        subtitle = map['subtitle'],
        slug = map['slug'],
        image = map['image'],
        time = map['time'],
        paragraphs = map['paragraphs'] != null
            ? (map['paragraphs'] as List).map((i) => Paragraph.fromMap(i)).toList()
            : null;
}
