import 'package:flutter/material.dart';

class Profile {
  final int id;
  final int userId;
  final int educationId;
  final int professionId;
  final String height;

  final String firstName;
  final String lastName;
  final String avatar;
  final String sex;
  final String birthday;
  final String maritalStatus;
  final String nationality;
  final String pronvice;
  final String dominion;
  final String skinColor;

  final String education;
  final String profession;
  final String bio;

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
        professionId = int.parse(map['profession_id'].toString()),
        educationId = int.parse(map['education_id'].toString()),
        education = map['education'],
        profession = map['profession'],
        bio = map['bio'];
}
