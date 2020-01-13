import 'package:flutter/material.dart';
import 'package:gem/models/job.dart';
import 'package:gem/scoped-model/main.dart';

import 'package:gem/ui/widgets/jobs/job_card.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:gem/style/style.dart' as ThemeColor;

import 'job_application_screen.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  final Entry entry;
  final Entry qualification;
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(
              fontFamily: 'itikaf',
              color: ThemeColor.Colors.gemPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  Widget _buildQualificationTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,
          style: TextStyle(
              fontFamily: 'itikaf',
              fontSize: 20,
              color: ThemeColor.Colors.gemPrimaryColor,
              fontWeight: FontWeight.bold)),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  const JobDetailScreen(
      {Key key,
      @required this.job,
      @required this.entry,
      @required this.qualification})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(job.title),
            backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: new AssetImage(job.image),
                                fit: BoxFit.cover,
                              )),
                              height: 100,
                              width: 100,
                            ))),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(job.company,
                                style: TextStyle(
                                    fontFamily: 'itikaf',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text('Dar Es Salaam, Tanzania',
                                style: TextStyle(
                                  fontFamily: 'itikaf',
                                  fontSize: 17,
                                ))
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 10),
                Text('JOB NAME: ' + job.title,
                    style: TextStyle(
                        fontFamily: 'itikaf',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('JOB CODE: ' + job.code,
                    style: TextStyle(
                        fontFamily: 'itikaf',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('APPLICATION DEADLINE: ' + job.deadline,
                    style: TextStyle()),
                SizedBox(
                  height: 30,
                ),
                Text("DESCRIPTION:",
                    style: TextStyle(
                      fontFamily: 'itikaf',
                      fontSize: 20.0,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child:
                      Text(job.description + job.description + job.description,
                          style: TextStyle(
                            fontFamily: 'itikaf',
                            fontSize: 20.0,
                          )),
                ),
                SizedBox(height: 20),
                _buildTiles(entry),
                SizedBox(height: 5),
                _buildQualificationTiles(qualification),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: RaisedButton(
                        color: ThemeColor.Colors.gemPrimaryColor,
                        child: Text('APPLY',
                            style: TextStyle(
                                fontFamily: 'itikaf',
                                fontSize: 20.0,
                                color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      JobApplicationScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => PaymentPage(
                          //               sender: PaymentSender.values[2],
                          //             )));
                        },
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
