import 'package:flutter/material.dart';
import 'package:gem/models/Menu.dart';


typedef TileTapCallback = void Function();

class DrawerTile extends StatelessWidget {
  final Menu menu;

  final TileTapCallback onTileTap;

  const DrawerTile({
    Key key,
    @required this.onTileTap,
    @required this.menu,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        onTileTap();
      },
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: new Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, top: 15.0, bottom: 25.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      menu.icon,
                      color: menu.isSelected ? Colors.white70 : Colors.black45,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      menu.title,
                      style: TextStyle(
                        color: menu.isSelected ? Colors.white : Colors.black45,
                        fontSize: 25.0,
                        fontFamily: 'bebas-neue',
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
