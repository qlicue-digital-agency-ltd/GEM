import 'package:flutter/foundation.dart';
import 'package:gem/models/profile.dart';
import 'package:meta/meta.dart';

class User {
  final int id;
  final String phone;
  final List<dynamic> followers;
  final List<dynamic> followings;
  String token;
  Profile profile;

  User({
    @required this.id,
    @required this.phone,
    @required this.followers,
    @required this.followings,
    this.token,
    this.profile,
  });

  User.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['phone'] != null),
        id = map['id'],
        phone = map['phone'].toString(),
        token = map['token'].toString(),
        followers = map['followers'],
        followings = map['followings'],
        profile = Profile.fromMap(map['profile']);
}
