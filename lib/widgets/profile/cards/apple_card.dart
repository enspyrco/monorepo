import 'package:flutter/material.dart';

class AppleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Image(
              image: AssetImage('assets/apple_logo/apple_logo_PNG19692.png'),
            ),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text('DEACTIVATE'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
