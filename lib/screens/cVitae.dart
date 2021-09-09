import 'package:flutter/material.dart';
import 'package:hire_me/widgets/cv/cvDrawer.dart';
import 'package:hire_me/widgets/cv/educationExpandable.dart';
import 'package:hire_me/widgets/cv/experienceExpandable.dart';
import '../widgets/cv/personalProfile.dart';

class CurriculumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      drawer: CvDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: Icon(Icons.home_outlined),
          )
        ],
        title: Text('My Curriculum Vitae',
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.blueGrey[800],
      ),
      backgroundColor: Colors.orange[100],
      body:
          // Experience highlight for the role
          SingleChildScrollView(
        child: Column(children: [
          ExperienceExpandable(),
          EducationExpandable(),
          PersonalProfile(),
        ]),
      ),
    );
  }
}
