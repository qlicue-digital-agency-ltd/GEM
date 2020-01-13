import 'package:flutter/material.dart';
import 'package:gem/api/api.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/pages/profile_page.dart';
import 'package:gem/ui/pages/search_friends.dart';
import 'package:gem/ui/widgets/image/image_holder.dart';
import 'package:gem/ui/widgets/tiles/no_items.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;
import 'package:flutter_swiper/flutter_swiper.dart';

class ResultChoice extends StatefulWidget {
  final MainModel model;

  const ResultChoice({Key key, @required this.model}) : super(key: key);
  @override
  _ResultChoiceState createState() => _ResultChoiceState();
}

class _ResultChoiceState extends State<ResultChoice> {
  String _displayName = '';

  @override
  void initState() {
    if (widget.model.getAllUsers().isNotEmpty) {
      _displayName = widget.model.getAllUsers()[0].profile.firstName;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return SingleChildScrollView(
          child: model.searchedUsers.isEmpty
              ? Center(
                  child: NoItemTile(
                    icon: Icons.supervised_user_circle,
                    subtitle: 'There are no friends yet',
                    title: 'Friends',
                  ),
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Here are people you may be interest in',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ThemeColor.Colors.gemPrimaryColor,
                          border: Border.all(color: Colors.white10)),
                      height: 300,
                      padding: EdgeInsets.all(16.0),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ProfilePage(
                                                user:
                                                    model.searchedUsers[index],
                                              )));
                                },
                                child: ImageHolder(
                                  image: api +
                                      'profile/' +
                                      model.searchedUsers[index].profile.id
                                          .toString(),
                                )),
                          );
                        },
                        itemCount: model.searchedUsers.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        pagination: SwiperPagination(),
                        onIndexChanged: _setDisplayName,
                        onTap: _navigate,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _displayName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _setDisplayName(int index) {
    print(index);
    setState(() {
      _displayName = widget.model.getAllUsers()[index].profile.firstName;
    });
  }

  void _navigate(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SearchFriendsPage()));
  }
}

////////////////////////////
// import 'package:flutter/material.dart';

//   void main() => runApp(MyApp());

//   class MyApp extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//       return MaterialApp(
//         title: 'Welcome to Flutter',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Flutter Display Image Tutorial'),
//           ),
//           body: Stack(
//             children: [
//               Center(child: CircularProgressIndicator()),
//               Center(
//                 child: FadeInImage.memoryNetwork(
//                   placeholder: kTransparentImage,
//                   image: 'https://flutter.io/images/catalog-widget-placeholder.png',
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
