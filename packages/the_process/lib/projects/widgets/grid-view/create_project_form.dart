import 'package:flutter/material.dart';

import '../../../utils/build_context_extensions.dart';
import '../../actions/create_project_action.dart';
import '../../actions/update_projects_view_action.dart';
import '../../models/project_model.dart';

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({Key? key}) : super(key: key);

  @override
  CreateProjectFormState createState() {
    return CreateProjectFormState();
  }
}

class CreateProjectFormState extends State<CreateProjectForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // The GlobalKey type parameter is FormState, not CreateProjectFormState.
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.dispatch(CreateProjectAction(
                          ProjectModel.init(name: _controller.text)));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.dispatch(
                        const UpdateProjectsViewAction(creating: false));
                  },
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
