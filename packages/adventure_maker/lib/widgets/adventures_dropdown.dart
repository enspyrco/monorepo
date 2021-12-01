import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/models/adventure_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AdventuresDropdown extends StatefulWidget {
  const AdventuresDropdown({Key? key}) : super(key: key);

  @override
  State<AdventuresDropdown> createState() => _AdventuresDropdownState();
}

class _AdventuresDropdownState extends State<AdventuresDropdown> {
  AdventureModel? selected;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IList<AdventureModel>>(
        distinct: true,
        converter: (store) => store.state.adventures,
        builder: (context, adventures) {
          return DropdownButton<AdventureModel>(
            value: selected,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            underline: const SizedBox(),
            onChanged: (AdventureModel? selection) {
              setState(() {
                selected = selection!;
              });
            },
            items: adventures
                .map<DropdownMenuItem<AdventureModel>>(
                    (item) => DropdownMenuItem(
                          child: Text(item.name),
                        ))
                .toList(),
          );
        });
  }
}
