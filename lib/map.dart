import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://goo.gl/maps/Dzbh2tJZK2ePuS5H8';

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class Navigation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: <Widget>[
            Text(
              'HostCo',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '02 4760 0602',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'info@hostcosydney.com',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Level 4, Holme Building,',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Science Road, University of Sydney, NSW 2006',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            MaterialButton(
              onPressed: _launchURL,
              child: Text(
                'Take me there',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ]),
          Image.asset('assets/photo/location.png',
              width: 350, fit: BoxFit.cover),
        ]);
  }
}
