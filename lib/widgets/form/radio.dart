import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  const MyRadio({Key? key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
}

enum SelectedUrgency { now, weeks, months }

class _MyRadioState extends State<MyRadio> {
  SelectedUrgency _urgency = SelectedUrgency.now;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Now'),
          leading: Radio(
            value: SelectedUrgency.now,
            groupValue: _urgency,
            onChanged: (SelectedUrgency? value) {
              setState(() {
                _urgency = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('I have some weeks'),
          leading: Radio(
            value: SelectedUrgency.weeks,
            groupValue: _urgency,
            onChanged: (SelectedUrgency? value) {
              setState(() {
                _urgency = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text('I can wait'),
          leading: Radio(
            value: SelectedUrgency.months,
            groupValue: _urgency,
            onChanged: (SelectedUrgency? value) {
              setState(() {
                _urgency = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
