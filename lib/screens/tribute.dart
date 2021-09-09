import 'package:flutter/material.dart';
import 'package:hire_me/screens/homepage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'package:hire_me/widgets/sharedWidgets/myAppBar.dart';
import 'package:hire_me/widgets/sharedWidgets/myDrawer.dart';

class TributePage extends StatelessWidget {
  final _name = 'Dr. Norman Borlaug';
  final _subTitle = 'The man who saved a billion lives';
  final _tributeLink = 'https://en.wikipedia.org/wiki/Norman_Borlaug';
  // function to open links
  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  // funtion to open links
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Scaffold(
      // -----------------------   APP BAR   --------------------------------- //
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            icon: Icon(Icons.home_outlined),
          )
        ],
        centerTitle: true,
        title:
            Text('Tribute Page', style: Theme.of(context).textTheme.headline1),
      ),
      // -----------------------   APP BAR   --------------------------------- //
      // -----------------------   DRAWER   --------------------------------- //
      drawer: MyDrawer(),
      // -----------------------   DRAWER   --------------------------------- //
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            // -------------- SUB TITLE ------------- //
            Text(
              _subTitle,
              style: Theme.of(context).textTheme.headline3,
            ),
            // -------------- SUB TITLE ------------- //
            SizedBox(
              height: 20,
            ),
            // ---------- IMAGE ------------ //
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: mq.size.height * 0.02,
                horizontal: mq.size.width * 0.05,
              ),
              child: Column(
                children: [
                  // --------- IMAGE URL --------- //
                  Image(
                    image: NetworkImage(
                        'https://cdn.freecodecamp.org/testable-projects-fcc/images/tribute-page-main-image.jpg'),
                  ),
                  // --------- IMAGE URL --------- //
                  // --------- IMAGE FOOTER ------- //
                  SizedBox(
                    height: mq.size.height * 0.01,
                  ),
                  Text(
                    'Dr. Norman Borlaug, third from the left, trains biologists in Mexico on how to increase wheat yields - part of his life-long war on hunger.',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  )
                  // --------- IMAGE FOOTER ------- //
                ],
              ),
            ),
            // ---------- IMAGE ------------ //
            // ---------- BIOGRAPHY ------------ //

            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1914: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text('Born in Cresco, Iowa',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1933: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Leaves his family\'s farm to attend the University of Minnesota, thanks to a Depression era program known as the \"National Youth Administration\"',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1935: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Has to stop school and save up more money. Works in the Civilian Conservation Corps, helping starving Americans. "I saw how food changed them", he said. "All of this left scars on me."',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1937: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Finishes university and takes a job in the US Forestry Service',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1938: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Marries wife of 69 years Margret Gibson. Gets laid off due to budget cuts. Inspired by Elvin Charles Stakman, he returns to school study under Stakman, who teaches him about breeding pest-resistent plants.',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1942: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text('Receives a Ph.D. in Genetics and Plant Pathology',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1944: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Rejects a 100% salary increase from Dupont, leaves behind his pregnant wife, and flies to Mexico to head a new plant pathology program. Over the next 16 years, his team breeds 6,000 different strains of disease resistent wheat - including different varieties for each major climate on Earth.',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1953: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'crosses a short, sturdy dwarf breed of wheat with a high-yeidling American breed, creating a strain that responds well to fertilizer. It goes on to provide 95% of Mexico\'s wheat.',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1962: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Visits Delhi and brings his high-yielding strains of wheat to the Indian subcontinent in time to help mitigate mass starvation due to a rapidly expanding population',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1970: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text('Receives the Nobel Peace Prize',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1983: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'helps seven African countries dramatically increase their maize and sorghum yields',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('1984: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'Becomes a distinguished professor at Texas A&M University',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('2005: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text(
                  'States "We will have to double the world food supply by 2050.\" Argues that genetically modified crops are the only way we can meet the demand, as we run out of arable land. Says that GM crops are not inherently dangerous because \"we\'ve been genetically modifying plants and animals for a long time. Long before we called it science, people were selecting the best breeds.\"',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            ListTile(
              leading: Icon(Icons.arrow_right),
              title:
                  Text('2009: ', style: Theme.of(context).textTheme.headline3),
              subtitle: Text('Dies at the age of 95',
                  style: Theme.of(context).textTheme.bodyText1),
            ),

            // ---------- BIOGRAPHY ------------ //
            // ---------- QUOTE ----------- //
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: mq.size.height * 0.02,
                horizontal: mq.size.width * 0.15,
              ),
              child: Text(
                '\"Borlaug\'s life and achievement are testimony to the far-reaching contribution that one man\'s towering intellect, persistence and scientific vision can make to human peace and progress.\" \n -- Indian Prime Minister Manmohan Singh',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: mq.size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: mq.size.width * 0.05,
              ),
              child: Text(
                  'If you have time, you should read more about this incredible human being on his',
                  style: Theme.of(context).textTheme.headline2),
            ),
            TextButton(
              onPressed: () {
                _launchURL(_tributeLink);
              },
              child: Text('Wikipedia entry'),
            ),
          ],
        ),
      ]),
    );
  }
}
