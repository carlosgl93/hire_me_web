import 'package:flutter/material.dart';

import './expandableTitle.dart';
import './sectionTitle.dart';
import './myTile.dart';

class ExperienceExpandable extends StatefulWidget {
  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExperienceExpandable> {
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
                    title: 'Experience',
                    subtitle: 'SCRUM MASTER & TECH SUPPORT',
                    subSubtitle: 'Multiconsulting - January 2021 - Present',
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
                          tileTitle: 'SCRUM MASTER & TECH SUPPORT',
                          tileSubTitle:
                              'Multiconsulting - January 2021 - Today',
                        ),

                        // bullet points -> details about the position:
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTile(
                                mq: mq,
                                text:
                                    'Delivering continuous and incremental software with the company\'s dev team.',
                              ),
                              MyTile(
                                mq: mq,
                                text: 'Lead an international development team.',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'B2B Tech Support: LATAM, CL-PE-EC Redemptions.',
                              ),
                              MyTile(
                                mq: mq,
                                text: 'PHP & MySQL support & maintenance.',
                              ),
                            ],
                          ),
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'PIXELCODE.CL - NETWORKING EVENTS',
                          tileSubTitle:
                              'Junior Dev - September 2020 - December 2020',
                        ),

                        // bullet points -> details about the position:
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTile(
                                mq: mq,
                                text: 'React JS Web App with Firebase Back End',
                              ),
                              MyTile(
                                mq: mq,
                                text: 'Github project, issues, branches',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'First real project developed collaboratively',
                              ),
                            ],
                          ),
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'AMAZON CLONE REACT JS',
                          tileSubTitle: 'PERSONAL PROJECT',
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'COGNITIVE ENGLISH',
                          tileSubTitle:
                              'Operations Manager - March 2019 - August 2020',
                        ),

                        // bullet points -> details about the position:
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTile(
                                mq: mq,
                                text: 'Web Development & Maintenance',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'Manage: Business Model - Strategic Planning - Balance Score Card - Team Task Prioritization',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'Finances - Standard Procedure Design & Implementation',
                              ),
                              MyTile(
                                mq: mq,
                                text: 'Sales - Diagnostics - English Classes.',
                              ),
                            ],
                          ),
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'UBA TUBA ACAÍ RESTAURANT LA, CALIFORNIA',
                          tileSubTitle: 'Manager - July 2018 - February 2019',
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'SENSACIONAL SPA',
                          tileSubTitle:
                              'Chief Logistics - August 2017 - May 2018',
                        ),
                        // bullet points -> details about the position:
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MyTile(
                                mq: mq,
                                text:
                                    'Coordinate the team at each logistical level: Entree, operations and sales dispatches.',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'Generated \$2.100USD in monthly savings by optimizing existing processes.',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'Raised the daily average withdrawals from 7.7 to 10.4.',
                              ),
                              MyTile(
                                mq: mq,
                                text:
                                    'Reduced 20% inventory losses by implementing a new standard procedure.',
                              ),
                            ],
                          ),
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'SIEMENS CHILE INTERNSHIP',
                          tileSubTitle:
                              'Procurement Assistant - March 2016 - December 2016',
                        ),
                        SectionTitle(
                          mq: mq,
                          tileTitle: 'VALENT BIOSCIENCES INTERNSHIP',
                          tileSubTitle:
                              'COMEX Assistant - March 2015- July 2015',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isExpanded: _isOpen[0],
          ),
        ]);
  }
}
