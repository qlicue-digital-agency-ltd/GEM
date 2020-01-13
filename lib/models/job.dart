import 'package:meta/meta.dart';

class Job {
  final int id;
  final String title;
  final String time;
  final String code;
  final String company;
  final String image;
  final String description;
  final String deadline;
  final String link;

  Job(
      {@required this.id,
      @required this.title,
      @required this.time,
      @required this.image,
      @required this.code,
      @required this.company,
      @required this.description,
      @required this.deadline,
      @required this.link});
}
