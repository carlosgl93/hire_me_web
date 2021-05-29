import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hire_me/socialButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carlos Gumucio'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/profilepicture.png'))),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Text(
                'Acerca de mi:',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                  'Soy un desarrollador front end que usa Flutter para desarrollar aplicaciones móviles, web y desktop.'),
              SizedBox(
                height: 30,
              ),
              SocialButton(
                  icon: Icons.laptop,
                  iconColor: Colors.black,
                  label: 'Mi Github'),
              SizedBox(
                width: 20,
                height: 25,
              ),
              SocialButton(
                  url: 'https://www.instagram.com/canogumucio/',
                  icon: Icons.photo_camera,
                  iconColor: Colors.purple.shade300,
                  label: 'Mi instagram'),
            ],
          ),
        ),
      ),
    );
  }
}
