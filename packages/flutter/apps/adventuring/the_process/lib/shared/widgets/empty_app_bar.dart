// this came from RedFire - I don't remember why we had this, just a
// pre-configured aesthetic I guess?
// TODO: consider putting this in astro/widgets (with an explanation!)
import 'package:flutter/material.dart';

class EmptyAppBar extends AppBar {
  EmptyAppBar({Key? key})
      : super(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            key: key);
}
