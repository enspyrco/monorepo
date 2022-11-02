import 'package:astro/astro.dart';
import 'package:flutter/material.dart';

import '../../_app/state/app_state.dart';
import '../extensions/build_context_extension.dart';
import '../missions/select_adventure_node.dart';
import '../models/adventure_node.dart';
import '../models/drop_down_model.dart';

class AdventureNodesDropDown<N extends AdventureNode> extends StatelessWidget {
  const AdventureNodesDropDown({
    required DropDownModel<N> Function(AppState) transformer,
    Key? key,
  })  : _transformer = transformer,
        super(key: key);

  final DropDownModel<N> Function(AppState) _transformer;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, DropDownModel<N>>(
        transformer: _transformer,
        builder: (context, vm) {
          return DropdownButton<N>(
            focusColor: Colors.transparent,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            value: vm.selected,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            underline: const SizedBox(),
            onChanged: (N? selection) => (selection != null)
                ? context.launch(SelectAdventureNode(selection))
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
