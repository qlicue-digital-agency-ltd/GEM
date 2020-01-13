import 'package:meta/meta.dart';

class Comment {
  final int id;
  final String content;
  final String timestamp;
  final String avatar;
  final int caseId;

  Comment(
      {@required this.id,
      @required this.content,
      @required this.timestamp,
      @required this.avatar,
      @required this.caseId});
}
