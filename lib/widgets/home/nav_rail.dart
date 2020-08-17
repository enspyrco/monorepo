import 'package:flireator/actions/navigation/navigate_to_profile.dart';
import 'package:flireator/actions/navigation/store_nav_selection.dart';
import 'package:flireator/enums/navigation/nav_selection.dart';
import 'package:flireator/extensions/flutter/build_context_extensions.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/widgets/shared/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NavRail extends StatelessWidget {
  const NavRail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavSelection>(
        distinct: true,
        converter: (store) => store.state.navSelection,
        builder: (context, selection) {
          return Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selection.index,
                  onDestinationSelected: (int index) {
                    context.dispatch(StoreNavSelection(
                      selection: NavSelection.valueOfIndex(index),
                    ));
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.local_activity_outlined),
                      selectedIcon: Icon(Icons.local_activity),
                      label: Text('Local'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.local_airport_outlined),
                      selectedIcon: Icon(Icons.local_airport),
                      label: Text('GitHub'),
                    )
                  ],
                ),
              ),
              StoreConnector<AppState, Flireator>(
                distinct: true,
                converter: (store) => store.state.flireator,
                builder: (context, flireator) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (flireator == null)
                        ? CircularProgressIndicator()
                        : ProfileAvatar(flireator.photoURL, onPressed: () {
                            context.dispatch(NavigateToProfile());
                          }),
                  );
                },
              ),
            ],
          );
        });
  }
}
