import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/select_adventure_node_action.dart';
import '../extensions/build_context_extension.dart';
import '../models/adventure_node.dart';
import '../models/drop_down_model.dart';

class AdventureNodesDropDown<N extends AdventureNode> extends StatelessWidget {
  const AdventureNodesDropDown({
    required DropDownModel<N> Function(Store<AppState>) converter,
    Key? key,
  })  : _converter = converter,
        super(key: key);

  final DropDownModel<N> Function(Store<AppState>) _converter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DropDownModel<N>>(
        distinct: true,
        converter: _converter,
        builder: (context, vm) {
          return DropdownButton<N>(
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            value: vm.selected,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            underline: const SizedBox(),
            onChanged: (N? selection) => (selection != null)
                ? context.dispatch(SelectAdventureNodeAction(selection))
                : null,
            selectedItemBuilder: (BuildContext context) {
              return vm.nodes
                  .map<DropdownMenuItem<N>>((node) => DropdownMenuItem(
                        value: node,
                        child: Text(node.name,
                            style: const TextStyle(color: Colors.white)),
                      ))
                  .toList();
            },
            items: vm.nodes
                .map<DropdownMenuItem<N>>((node) => DropdownMenuItem(
                      value: node,
                      child: Text(node.name,
                          style: const TextStyle(color: Colors.black)),
                    ))
                .toList(),
          );
        });
  }
}
