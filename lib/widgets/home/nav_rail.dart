import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/navigation/store_nav_bar_selection.dart';
import 'package:the_process/enums/navigation/nav_bar_selection.dart';
import 'package:the_process/extensions/dart_core_extensions.dart';
import 'package:the_process/extensions/flutter_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/widgets/shared/profile_avatar.dart';

class NavRail extends StatelessWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavBarSelection>(
        distinct: true,
        converter: (store) => store.state.navSelection,
        builder: (context, selection) {
          return Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selection.index,
                  onDestinationSelected: (int index) {
                    context.dispatch(StoreNavBarSelection(
                      selection: index.toNavBarSelection(),
                    ));
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.short_text),
                      selectedIcon: Icon(Icons.wrap_text),
                      label: Text('Sections'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assignment),
                      selectedIcon: Icon(Icons.assessment),
                      label: Text('Topics'),
                    ),
                  ],
                ),
              ),
              StoreConnector<AppState, String>(
                distinct: true,
                converter: (store) => store.state.profileData?.photoURL,
                builder: (context, photoURL) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileAvatar(photoURL),
                  );
                },
              ),
            ],
          );
        });
  }
}
