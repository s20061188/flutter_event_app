import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '2:00pm Groom arrives for ceremony, guests to arrive',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '2:30pm Ceremony',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '3:30pm Couple departs for photographs',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '5:30pm Seat guests for dinner',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]);
  }
}
