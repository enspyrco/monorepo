import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:adventure_maker/shared/extensions/build_context_extension.dart';
import 'package:adventure_maker/shared/state/adventure_node.dart';
import 'package:adventure_maker/shared/state/adventure_subtree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdventureNodesDropDown<S extends AdventureSubtree<M>,
    M extends AdventureNode> extends StatelessWidget {
  const AdventureNodesDropDown({
    required S Function(Store<AppState>) converter,
    Key? key,
  })  : _converter = converter,
        super(key: key);

  final S Function(Store<AppState>) _converter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, S>(
        distinct: true,
        converter: _converter,
        builder: (context, subtree) {
          return DropdownButton<M>(
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            value: subtree.selected,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            underline: const SizedBox(),
            onChanged: (M? selection) => (selection != null)
                ? context.dispatch(SelectAdventureNodeAction(selection))
                : null,
            selectedItemBuilder: (BuildContext context) {
              return subtree.list
                  .map<DropdownMenuItem<M>>((node) => DropdownMenuItem(
                        value: node,
                        child: Text(node.name,
                            style: const TextStyle(color: Colors.white)),
                      ))
                  .toList();
            },
            items: subtree.list
                .map<DropdownMenuItem<M>>((node) => DropdownMenuItem(
                      value: node,
                      child: Text(node.name,
                          style: const TextStyle(color: Colors.black)),
                    ))
                .toList(),
          );
        });
  }
}
