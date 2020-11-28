import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/enums/navigation/nav_bar_selection.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/widgets/home/nav_rail.dart';
import 'package:the_process/widgets/sections/sections_page.dart';
import 'package:the_process/widgets/topics/topics_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Map<NavBarSelection, Widget> widgetFrom = {
    NavBarSelection.sections: SectionsPage(),
    NavBarSelection.topics: TopicsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavRail(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavBarSelection>(
            distinct: true,
            converter: (store) => store.state.navSelection,
            builder: (context, selection) => widgetFrom[selection],
          )
        ],
      ),
    );
  }
}
