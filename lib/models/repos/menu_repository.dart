import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/constants/constants.dart';

import '../Menu.dart';

class MenuRepository {
  static List<Menu> loadMenu() {
    List<Menu> allMenu = <Menu>[
      Menu(
          id: 1,
          constant: homeScreen,
          icon: FontAwesomeIcons.home,
          title: 'Home',
          isSelected: true,
          type: 0),
      Menu(
          id: 2,
          constant: profileScreen,
          icon: FontAwesomeIcons.userCircle,
          title: 'Profile',
          isSelected: true,
          type: 0),
    Menu(
          id: 5,
          constant: aboutScreen,
          icon: Icons.info_outline,
          title: 'About',
          isSelected: true,
          type: 0),
      Menu(
          id: 6,
          constant: helpScreen,
          icon: FontAwesomeIcons.questionCircle,
          title: 'Help',
          isSelected: true,
          type: 0),
      Menu(
          id: 7,
          constant: securityScreen,
          icon: Icons.verified_user,
          title: 'Security',
          isSelected: true,
          type: 0),
      Menu(
        id: 8,
        constant: logoutScreen,
        icon: Icons.exit_to_app,
        title: 'Logout',
        isSelected: true,
        type: 0,
      ),
      Menu(
        id: 9,
        constant: addAccountScreen,
        icon: Icons.add,
        title: 'Add Account',
        isSelected: true,
        type: 1,
      ),
      Menu(
        id: 10,
        constant: manageAccountScreen,
        icon: Icons.settings,
        title: 'Manage Accounts',
        isSelected: true,
        type: 1,
      ),
    ];
    return allMenu.toList();
  }
}
