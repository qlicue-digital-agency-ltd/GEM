import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';

import 'package:gem/ui/widgets/jobs/job_card.dart';
import 'package:gem/ui/widgets/tiles/no_items.dart';

import 'package:scoped_model/scoped_model.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.getJobs().isEmpty
            ? Center(
              child: NoItemTile(
                  icon: 'assets/icons/employee.png',
                  subtitle: 'No jobs to show',
                  title: 'Jobs',
                ),
            )
            : ListView.builder(
                itemCount: model.getJobs().length,
                itemBuilder: (BuildContext context, int index) {
                  return JobCard(
                    model: model,
                    job: model.getJobs()[index],
                    onCardTap: () {},
                  );
                },
              );
      },
    );
  }
}
