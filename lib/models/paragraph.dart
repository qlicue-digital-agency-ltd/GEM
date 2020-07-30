import 'package:flutter/material.dart';

import 'advert.dart';

class Paragraph {
  final int id;
  final String body;
  final int advertId;
  final int paragraphableId;
  final String paragraphableType;
  final String time;
  final Advert advert;

  Paragraph({
    @required this.id,
    @required this.body,
    @required this.advertId,
    @required this.paragraphableId,
    @required this.paragraphableType,
    @required this.time,
    @required this.advert,
  });

  Paragraph.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        id = map['id'],
        body = map['body'],
        advertId = int.parse(map['advert_id'].toString()),
        paragraphableId = int.parse(map['paragraphable_id'].toString()),
        paragraphableType = map['paragraphable_type'],
        time = map['time'],
        advert = Advert.fromMap(map['advert']);
}
