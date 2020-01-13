import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/util/util.dart';

class Cats {
  final int id;
  final String name;
  final dynamic icon;
  final CategoryItem categoryItem;
  List<SubCat> subcats;
  bool isTapped;
  Cats(
      {@required this.id,
      @required this.name,
      @required this.icon,
      @required this.categoryItem,
      @required this.subcats,
      @required this.isTapped});
}

final List<Cats> categories = [
  Cats(
      id: 1,
      icon: FontAwesomeIcons.users,
      name: 'Religion',
      subcats: religionSubcats,
      categoryItem: CategoryItem.Religion,
      isTapped: false),
  Cats(
      id: 2,
      icon: FontAwesomeIcons.calendar,
      name: 'Age',
      subcats: ageSubcats,
      categoryItem: CategoryItem.Age,
      isTapped: false),
  Cats(
      id: 3,
      icon: FontAwesomeIcons.rulerVertical,
      name: 'Height',
      subcats: heightSubcats,
      categoryItem: CategoryItem.Height,
      isTapped: false),
  Cats(
      id: 4,
      icon: FontAwesomeIcons.bookOpen,
      name: 'Education',
      subcats: educationSubcats,
      categoryItem: CategoryItem.Education,
      isTapped: false),
  Cats(
      id: 5,
      icon: FontAwesomeIcons.peopleCarry,
      name: 'Jobs',
      subcats: jobsSubcats,
      categoryItem: CategoryItem.Jobs,
      isTapped: false),
  Cats(
      id: 6,
      icon: FontAwesomeIcons.smile,
      name: 'Race',
      subcats: raceSubcats,
      categoryItem: CategoryItem.Race,
      isTapped: false),
];

class SubCat {
  String name;
  bool isSelected;

  SubCat({@required this.name, @required this.isSelected});
}

List<SubCat> religionSubcats = <SubCat>[
  SubCat(
    name: 'Christian',
    isSelected: false,
  ),
  SubCat(
    name: 'Muslim',
    isSelected: false,
  ),
  SubCat(
    name: 'Hindi',
    isSelected: false,
  ),
  SubCat(
    name: 'Buddhism',
    isSelected: false,
  ),
  SubCat(
    name: 'Others',
    isSelected: false,
  )
];

List<SubCat> ageSubcats = <SubCat>[
  SubCat(
    name: '18 - 24',
    isSelected: false,
  ),
  SubCat(
    name: '25 - 35',
    isSelected: false,
  ),
  SubCat(
    name: '35 - 44',
    isSelected: false,
  ),
  SubCat(
    name: '45 - 60',
    isSelected: false,
  ),
  SubCat(
    name: 'Above 60',
    isSelected: false,
  ),
];

List<SubCat> heightSubcats = <SubCat>[
  SubCat(
    name: 'Tall',
    isSelected: false,
  ),
  SubCat(
    name: 'Short',
    isSelected: false,
  ),
  SubCat(
    name: 'Medium',
    isSelected: false,
  ),
];

List<SubCat> educationSubcats = <SubCat>[
  SubCat(
    name: 'Non',
    isSelected: false,
  ),
  SubCat(
    name: 'Primary',
    isSelected: false,
  ),
  SubCat(
    name: 'Secondary',
    isSelected: false,
  ),
  SubCat(
    name: 'A-Level',
    isSelected: false,
  ),
  SubCat(
    name: 'University',
    isSelected: false,
  ),
];

List<SubCat> jobsSubcats = <SubCat>[
  SubCat(
    name: 'Unemployeed',
    isSelected: false,
  ),
  SubCat(
    name: 'Employeed',
    isSelected: false,
  )
];

List<SubCat> raceSubcats = <SubCat>[
  SubCat(
    name: 'African',
    isSelected: false,
  ),
  SubCat(
    name: 'Asian',
    isSelected: false,
  ),
  SubCat(
    name: 'Latin',
    isSelected: false,
  ),
  SubCat(
    name: 'Arab',
    isSelected: false,
  ),
  SubCat(
    name: 'European',
    isSelected: false,
  )
];
