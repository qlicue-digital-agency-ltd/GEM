import 'package:flutter/foundation.dart';

class District {
  final int id;
  final String name;
  final int regionId;

  District({
    @required this.id,
    @required this.name,
    @required this.regionId,
  });

  District.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        regionId = int.parse(map['region_id'].toString());
}
