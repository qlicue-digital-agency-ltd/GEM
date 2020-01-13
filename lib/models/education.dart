import 'package:flutter/foundation.dart';

class Education {
  final int id;
  final String level;

  Education({@required this.id, @required this.level});

  Education.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['level'] != null),
        id = map['id'],
        level = map['level'];
}
