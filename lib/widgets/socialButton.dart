import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    this.url = 'https://github.com/carlosgl93/hire_me_web',
    this.icon = Icons.exit_to_app,
    this.iconColor = Colors.orange,
    this.label = 'Go',
  }) : super(key: key);

  final String url;
  final IconData icon;
  final Color iconColor;
  final String label;

  void _launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    // MediaQuery object variable
    final mq = MediaQuery.of(context);
    return SizedBox(
      width: mq.size.width * 0.5,
      height: mq.size.height * 0.075,
      child: buildSocialButton(mq, context),
    );
  }

// button container
  TextButton buildSocialButton(MediaQueryData mq, BuildContext context) {
    return TextButton(
        onPressed: () => _launchURL(url),
        child: Center(child: buildButtonRow(mq, context)),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(3),
            overlayColor: MaterialStateProperty.all(Colors.grey[100]),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Color(0xFF00028)),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: mq.size.height * 0.01,
                  horizontal: mq.size.width * 0.1),
            ),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 24))));
  }

  // button content, icon + title

  Row buildButtonRow(MediaQueryData mq, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: mq.size.width * 0.075),
        SizedBox(
          width: mq.size.width * 0.01,
          height: mq.size.height * 0.01,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: mq.textScaleFactor * 18,
                color: Colors.black,
              ),
            )
          ],
        ))
      ],
    );
  }
}
