import 'package:flutter/foundation.dart';

class District {
  final int id;
  final String name;
  final String regionId;

  District({
    @required this.id,
    @required this.name,
    @required this.regionId,
  });

  District.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        regionId = map['region_id'];
}
