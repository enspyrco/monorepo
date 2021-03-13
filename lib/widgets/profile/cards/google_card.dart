import 'package:flutter/material.dart';

class GoogleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Image(
                image: AssetImage('assets/google_logo/google_PNG19630.png')),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('DEACTIVATE'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
