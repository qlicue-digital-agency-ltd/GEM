import 'package:flutter/foundation.dart';
import 'package:gem/models/profile.dart';
import 'package:meta/meta.dart';

class User {
  final int id;
  final String token;
  final String phone;
  bool hasProfile;
  final List<dynamic> followers;
  final List<dynamic> followings;
  Profile profile;

  User(
      {@required this.id,
      @required this.phone,
      @required this.token,
      @required this.profile,
      @required this.followers,
      @required this.followings,
      this.hasProfile});

  User.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['phone'] != null),
        id =  map['id'],
        phone = map['phone'].toString(),
        token = map['token'] ?? '0',
        profile =
            map['profile'] != null ? Profile.fromMap(map['profile']) : null,
        followers = map['followers'],
        followings = map['followings'],
        hasProfile = map['profile'] != null ? true : false;
}
