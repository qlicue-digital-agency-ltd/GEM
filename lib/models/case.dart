import 'package:meta/meta.dart';

class Case {
  final int id;
  final String title;
  final String time;
  final String subtitle;
  final String body;
  final String image;
  final List<int> adds;
  final List<String> paragraphs;
  final String author;
  final int likes;
  final bool likeStatus;

  Case(
      {@required this.id,
      @required this.title,
      @required this.time,
      @required this.subtitle,
      @required this.body,
      @required this.image,
      @required this.likeStatus,
      @required this.adds,
      @required this.paragraphs,
      @required this.author,
      @required this.likes});
}
