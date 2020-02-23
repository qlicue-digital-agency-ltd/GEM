import 'package:flutter/material.dart';

class Filters {
  String race;
  String religion;
  String age;
  String height;
  String education;
  String employment;
  String sex;

  Filters(
      {@required this.race,
      @required this.religion,
      @required this.age,
      @required this.height,
      @required this.education,
      @required this.employment,
      @required this.sex});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      race: race,
      religion: religion,
      age: age,
      height: height,
      education: education,
      employment: employment,
      sex: sex
    };
    return map;
  }

  Filters.fromMap(Map<String, dynamic> map)
      : assert(map[race] != null),
        assert(map[religion] != null),
        race = map['race'],
        religion = map['religion'],
        age = map['age'],
        height = map['height'],
        education = map['education'],
        employment = map['employment'],
        sex = map['sex'];
}
