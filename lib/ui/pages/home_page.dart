import 'package:flutter/material.dart';

import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/screens/drawer_page.dart';
import 'package:gem/ui/screens/friendship_screen.dart';
import 'package:gem/ui/screens/jobs_screen.dart';

import 'package:gem/ui/screens/trading_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class HomePage extends StatefulWidget {
  final MainModel model;

  const HomePage({Key key, @required this.model}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    widget.model.loadCases();
    widget.model.loadTips();
    widget.model.loadAdds();

    widget.model.loadMenu();

    //server calls..
    widget.model.fetchTips();

    widget.model.fetchAllUsers();
    _tabController = new TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    if (index == 0) {
      widget.model.setActiveTab(true);
    } else {
      widget.model.setActiveTab(false);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTopTapped(int index) {
    widget.model.setTopTab(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      FriendshipScreen(
        model: widget.model,
      ),
      TradingScreen(model: widget.model),
      JobsScreen(),
    ];

    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColor.Colors.gemPrimaryColor,
              title: Text('GEM',
                  style: TextStyle(
                    fontFamily: 'itikaf',
                    fontSize: 20.0,
                  )),
              bottom: model.isFirstTab
                  ? TabBar(
                      onTap: _onTopTapped,
                      indicatorColor: Colors.white,
                      controller: _tabController,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(Icons.supervised_user_circle),
                          text: 'Meet',
                        ),
                        Tab(
                          icon: Icon(Icons.library_books),
                          text: 'Cases',
                        ),
                        Tab(
                          icon: Icon(Icons.layers),
                          text: 'Tips',
                        ),
                      ],
                    )
                  : PreferredSize(
                      preferredSize: const Size.fromHeight(55.0),
                      child: Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.white),
                          child: Container(
                            height: 55.0,
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Expanded(
                                    child: TabBar(
                                  onTap: _onTopTapped,
                                  indicatorColor: Colors.white,
                                  controller: _tabController,
                                  tabs: <Widget>[
                                    Tab(
                                      icon: Icon(Icons.supervised_user_circle),
                                    ),
                                    Tab(
                                      icon: Icon(Icons.library_books),
                                    ),
                                    Tab(
                                      text: 'Tips',
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ))),
            ),
            body: DefaultTabController(
              length: 3,
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Relationship'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Trade'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time),
                  title: Text('Jobs'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: _onItemTapped,
            ),
            drawer: SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: DrawerPage(
                model: model,
              ),
            ));
      },
    );
  }
}
