import 'package:adventure_maker/adventures/actions/set_selected_adventure_action.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/adventures/state/adventures_state.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AdventuresDropDown extends StatelessWidget {
  const AdventuresDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AdventuresState>(
        distinct: true,
        converter: (store) => store.state.adventures,
        builder: (context, adventures) {
          return DropdownButton<AdventureModel>(
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            value: adventures.selected,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            underline: const SizedBox(),
            onChanged: (AdventureModel? selection) => (selection != null)
                ? context.dispatch(SetSelectedAdventureAction(selection))
                : null,
            selectedItemBuilder: (BuildContext context) {
              return adventures.list
                  .map<DropdownMenuItem<AdventureModel>>(
                      (item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ))
                  .toList();
            },
            items: adventures.list
                .map<DropdownMenuItem<AdventureModel>>(
                    (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ))
                .toList(),
          );
        });
  }
}
