import 'package:flutter/foundation.dart';

class Profession {
  final int id;
  final String code;
  final String description;
  final String descriptionInSwahili;
  bool isSelected = false;

  Profession(
      {@required this.id,
      @required this.code,
      @required this.description,
      @required this.descriptionInSwahili});

  Profession.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        code = map['code'],
        description = map['description'],
        descriptionInSwahili = map['description_in_swahili'];
}
