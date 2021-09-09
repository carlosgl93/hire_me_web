import 'package:flutter/material.dart';

class CvDrawer extends StatelessWidget {
  const CvDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.all(0),
            // padding: EdgeInsets.fromLTRB(left, top, right, bottom)
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                mq.size.width * 0.0125,
                mq.size.height * 0.01,
                0,
                0,
              ),
              child: Text(
                'Carlos\nGumucio Labbé',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 4.0,
                  color: Colors.orange[100],
                  fontWeight: FontWeight.bold,
                  fontSize: mq.textScaleFactor * 37.5,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(0),
              color: Theme.of(context).accentColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: mq.size.height * 0.04,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: mq.size.width * 0.03),
                    child: Text(
                      'FULL STACK DEV\nSCRUM MASTER\nPROJECT MANAGER',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mq.size.height * 0.035,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: mq.size.width * 1,
                    height: mq.size.height * 0.05,
                    color: Colors.orange[100],
                    child: Text('GENERAL INFO',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  SizedBox(
                    height: mq.size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: mq.size.width * 0.03),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '+569 4292 1413\ncgumucio93@gmail.com\ngithub: carlosgl93',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: mq.size.height * 0.025,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: mq.size.width * 1,
                    height: mq.size.height * 0.05,
                    color: Colors.orange[100],
                    child: Text('SKILL SET',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: mq.size.height * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Advanced English, written and spoken',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Teamplayer and fast learner',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'VSC - Windows - Chrome - Excel hotkeys',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: mq.size.width * 1,
                    height: mq.size.height * 0.05,
                    color: Colors.orange[100],
                    child: Text('PRINCIPLES',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: mq.size.height * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Be authentic',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Errors and failures are growth opportunities',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'I compare only with myself',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Feedback is and will always be welcomed',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: mq.size.width * 1,
                    height: mq.size.height * 0.05,
                    color: Colors.orange[100],
                    child: Text('VALUES',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: mq.size.height * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Reputation + Honesty\n= Trust',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Patience + Humility\n= Constant learning',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Ethics + Empathy\n= Respect',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Responsibility + Versatility\n= Reliability',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Consciousness + Environment\n= Sustainability',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: mq.size.width * 1,
                    height: mq.size.height * 0.05,
                    color: Colors.orange[100],
                    child: Text('OTHER / MISC',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: mq.size.height * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Healthy Living, diet and habits',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Wall-Climbing - Soccer/Football',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'CSGO Global Elite',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        ListTile(
                          leading:
                              Icon(Icons.arrow_right_alt, color: Colors.white),
                          title: Text(
                            'Rock - Metal - Funk',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      // child: Container(
      //   constraints: BoxConstraints(
      //     minWidth: mq.size.width,
      //     maxWidth: mq.size.width,
      //   ),
      //   alignment: Alignment.centerLeft,
      //   height: mq.size.height,
      //   padding: EdgeInsets.symmetric(
      //     vertical: mq.size.height * 0.05,
      //     horizontal: mq.size.width * 0.05,
      //   ),
      //   color: Colors.blueGrey[800],
      //
      //   ),
      // ),
    );
  }
}
