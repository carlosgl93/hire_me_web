import 'package:flutter/material.dart';
import 'package:hire_me/widgets/cv/myBulletPoint.dart';

import './expandableTitle.dart';

import './myTile.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<PersonalProfile> {
  List<bool> _isOpen = [true];
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
                  title: 'Personal Profile',
                  subtitle: 'Extroverted & Curious',
                  subSubtitle: 'Teamplayer - Communicative - Self Conscious',
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: mq.size.height * 0.05,
                      horizontal: mq.size.width * 0.1,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'I belong to a family of 5 siblings, me being the fourth one at 28 years old.\n\nExtroverted that does not doubt asking or sharing what I think. I\'m always interested in generating new contacts and friendships.\n\nI characterize for always be looking to understand the organization in which I am immersed so that I can find new ways to optimize already existing processes.\n\nI\'m always open to get feedback, I take it as a growth opportunity based in the humility that\'s needed to accept and admit our own mistakes and analyze them so I can avoid doing those same mistakes in the future.\n\n',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.circle,
                            color: Colors.blueGrey[900],
                            size: mq.textScaleFactor * 15,
                          ),
                          title: Text(
                            "[...] voluntarily transform the chaos of potential into realities of habitable order [...]\"\n - Jordan Peterson",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        // MyTile(
                        //   mq: mq,
                        //   text:
                        //       "[...] voluntarily transform the chaos of potential into  realities of habitable order [...]\" - Jordan Peterson",
                        // ),
                      ],
                    ),
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
