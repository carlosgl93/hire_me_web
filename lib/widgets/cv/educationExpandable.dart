import 'package:flutter/material.dart';

import './expandableTitle.dart';
import './sectionTitle.dart';
import './myTile.dart';

class EducationExpandable extends StatefulWidget {
  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<EducationExpandable> {
  List<bool> _isOpen = [false];
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return ExpansionPanelList(
      // callback
      expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
      // children
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (context, isOpen) {
            return Row(
              children: [
                ExpandableTitle(
                  mq: mq,
                  title: 'Education',
                  subtitle: 'Dart / Flutter Full Stack Dev ',
                  subSubtitle: 'Self Taught - July 2020 - Present',
                  isOpen: isOpen,
                ),
              ],
            );
          },
          body: Column(
            children: [
              //  role
              Container(
                alignment: AlignmentDirectional.topCenter,
                color: Colors.orange[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SectionTitle(
                        mq: mq,
                        tileTitle: 'CONTINUOUS EDUCATION - SELF TAUGHT',
                        tileSubTitle:
                            'Dart / Flutter Full Stack Dev - July 2020 - Present',
                      ),

                      // bullet points -> details about the position:
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTile(
                              mq: mq,
                              text:
                                  'Platform responsive apps: iOS - Android - Web - Desktop',
                            ),
                            MyTile(
                              mq: mq,
                              text: 'Firebase / Python - Flask ',
                            ),
                            MyTile(
                              mq: mq,
                              text:
                                  'CV App - To Do App - Tintero App (WIP) - Ecommerce (WIP) ',
                            ),
                          ],
                        ),
                      ),
                      // Second Education title
                      SectionTitle(
                        mq: mq,
                        tileTitle: '',
                        tileSubTitle: 'For my current position',
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTile(
                              mq: mq,
                              text: 'Scrum Framework - Project Management',
                            ),
                            MyTile(
                              mq: mq,
                              text: 'MySQL and database management',
                            ),
                          ],
                        ),
                      ),
                      SectionTitle(
                        mq: mq,
                        tileTitle: '4GEEKS ACADEMY',
                        tileSubTitle:
                            'Full Stack Developer  July 2019 - July 2020',
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTile(
                              mq: mq,
                              text: 'MERN Stack',
                            ),
                            MyTile(
                              mq: mq,
                              text: 'HTML - CSS - JavaScript',
                            ),
                            MyTile(
                              mq: mq,
                              text: 'Python - Flask',
                            ),
                          ],
                        ),
                      ),
                      SectionTitle(
                        mq: mq,
                        tileTitle: 'MICROSOFT INTRO. TO DATA SCIENCE',
                        tileSubTitle: 'DAT101x - November 2018 - January 2019',
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTile(
                              mq: mq,
                              text: 'Info. Analysis & visualization.',
                            ),
                            MyTile(
                              mq: mq,
                              text:
                                  'MySQL - Python - Excel - Statistics - Azure ML.',
                            ),
                          ],
                        ),
                      ),
                      SectionTitle(
                        mq: mq,
                        tileTitle: 'UNIVERSIDAD DEL DESARROLLO',
                        tileSubTitle: 'Business Major - 2012 - 2017',
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTile(
                              mq: mq,
                              text: 'Management & Administration',
                            ),
                            MyTile(
                              mq: mq,
                              text:
                                  'Process Optimization - Customer Experience',
                            ),
                            MyTile(
                              mq: mq,
                              text: 'Finance - Economy - Accounting',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          isExpanded: _isOpen[0],
        ),
      ],
    );
  }
}
