import 'package:meta/meta.dart';

class Chat {
  final int id;
  final int idFrom;
  final int type;
  final String sticker;
  final String content;
  final String timestamp;
  final String image;

  Chat({
    @required this.id,
    @required this.idFrom,
    @required this.type,
    @required this.sticker,
    @required this.content,
    @required this.timestamp,
    @required this.image,
  });
}
