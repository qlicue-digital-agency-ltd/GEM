import 'package:flutter/material.dart';
import 'package:gem/models/job.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/screens/job_detail_screen.dart';
import 'package:share/share.dart';

import 'package:gem/style/style.dart' as ThemeColor;

typedef JobTapCallback = void Function();

class JobCard extends StatelessWidget {
  final JobTapCallback onCardTap;
  final Job job;
  final MainModel model;

  const JobCard(
      {Key key,
      @required this.onCardTap,
      @required this.job,
      @required this.model})
      : assert(onCardTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: InkWell(
          onTap: onCardTap,
          child: Card(
            elevation: 10,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(job.company,
                          style: TextStyle(
                            fontFamily: 'itikaf',
                            fontSize: 20.0,
                            
                          ))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: new AssetImage(job.image),
                                  fit: BoxFit.cover,
                                )),
                                height: 100,
                                width: 100,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Share.share(
                                          'check out my website https://qlicue.co.tz.com');
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: ThemeColor.Colors.gemPrimaryColor,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(job.code + ' (' + job.title + ')',
                                style: TextStyle(
                                  fontFamily: 'itikaf',
                                  fontSize: 20.0,
                                  
                                )),
                            subtitle: Text(job.description,
                                style: TextStyle(
                                  fontFamily: 'itikaf',
                                  fontSize: 18.0,
                                 
                                )),
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: RaisedButton(
                        color: ThemeColor.Colors.gemPrimaryColor,
                        child: Text('VIEW MORE',
                            style: TextStyle(
                                fontFamily: 'itikaf',
                                fontSize: 20.0,
                                color: Colors.white)),
                        onPressed: () {
                          print('Apply');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetailScreen(
                                        job: job,
                                        entry: data[0],
                                        qualification: qualification[0],
                                      )));
                        },
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Qualifications',
    <Entry>[
      Entry(
          '1. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '2. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '3. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '4. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '5. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '6. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '7. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
    ],
  ),
];

final List<Entry> qualification = <Entry>[
  Entry(
    'Job Description',
    <Entry>[
      Entry(
          '1. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '2. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '3. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '4. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '5. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '6. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
      Entry(
          '7. Chupa chups fruitcake chupa chups gingerbread bear claw apple pie jujubes'),
    ],
  ),
];