import 'package:flutter/material.dart';

class Profile {
  final int id;
  final int userId;
  int educationId;
  int professionId;
  String height;
  String firstName;
  String lastName;
  String avatar;
  String sex;
  String birthday;
  String maritalStatus;
  String nationality;
  String pronvice;
  String dominion;
  String skinColor;
  String education;
  String profession;
  String bio;

  Profile(
      {@required this.id,
      @required this.userId,
      @required this.firstName,
      @required this.lastName,
      @required this.avatar,
      @required this.sex,
      @required this.birthday,
      @required this.maritalStatus,
      @required this.nationality,
      @required this.pronvice,
      @required this.dominion,
      @required this.skinColor,
      @required this.height,
      @required this.educationId,
      @required this.professionId,
      @required this.education,
      @required this.profession,
      @required this.bio});

  Profile.fromMap(Map<String, dynamic> map)
      : assert(map['id'] != null),
        assert(map['user_id'] != null),
        id = map['id'],
        userId = int.parse(map['user_id'].toString()),
        firstName = map['first_name'],
        lastName = map['last_name'],
        avatar = map['avatar'],
        sex = map['sex'],
        birthday = map['birthday'],
        maritalStatus = map['marital_status'],
        nationality = map['nationality'],
        pronvice = map['pronvice'],
        dominion = map['dominion'],
        skinColor = map['skin_color'],
        height = map['height'],
        professionId = map['profession_id'] != null
            ? int.parse(map['profession_id'].toString())
            : null,
        educationId = map['education_id'] != null
            ? int.parse(map['education_id'].toString())
            : null,
        education = map['education'],
        profession = map['profession'],
        bio = map['bio'];
}
