import 'package:flutter/foundation.dart';
import 'package:gem/models/profile.dart';
import 'package:meta/meta.dart';

class User {
  final int id;
  final String phone;
  Profile profile;

  User({
    @required this.id,
    @required this.phone,
    this.profile,
  });

  User.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['phone'] != null),
        id = map['id'],
        phone = map['phone'].toString(),
        profile = Profile.fromMap(map['profile']);
}
