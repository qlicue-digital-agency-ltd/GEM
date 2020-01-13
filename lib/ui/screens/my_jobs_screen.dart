import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class MyJobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Payed for Jobs'),
          ),
          body: Padding(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              itemCount: model.getJobs().length,
              reverse: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: FlatButton(
                    child: Row(
                      children: <Widget>[
                        Material(
                          child: Image(
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  model.getJobs()[index].image)),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          clipBehavior: Clip.hardEdge,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    model.getJobs()[index].company,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                                ),
                                Container(
                                  child: Text(
                                   model.getJobs()[index].title,

                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  margin:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                )
                              ],
                            ),
                            margin: EdgeInsets.only(left: 20.0),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyChat(
                      //               model: model,
                      //             )));
                    },
                    color: ThemeColor.Colors.gemPrimaryColor,
                    padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
                );
              },
            ),)
        );
      },
    );
  }
}
