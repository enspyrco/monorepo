import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:the_process/build_context_extensions.dart';

import '../../../app/state/app_state.dart';
import '../../missions/create_project.dart';
import '../../models/project_state.dart';
import '../../models/update_projects_view.dart';

class NewProjectItem extends StatelessWidget {
  const NewProjectItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, bool>(
        transformer: (state) => state.projects.creating,
        builder: (context, creating) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue[100]!, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: (creating)
                  ? const CreateProjectForm()
                  : InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () =>
                          context.land(UpdateProjectsView(creating: true)),
                      child: Center(
                          child: Text('+',
                              style: Theme.of(context).textTheme.headline5)),
                    ),
            ),
          );
        });
  }
}

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({Key? key}) : super(key: key);

  @override
  CreateProjectFormState createState() {
    return CreateProjectFormState();
  }
}

class CreateProjectFormState extends State<CreateProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NameTextField(controller: _controller),
          ButtonsRow(formKey: _formKey, controller: _controller),
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: TextFormField(
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Name...'),
        controller: _controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onFieldSubmitted: (s) => print(s),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController controller,
  })  : _formKey = formKey,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () {
            context.land(UpdateProjectsView(creating: false));
          },
          child: const Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.launch(
                  CreateProject(ProjectState.initWith(name: _controller.text)));
            }
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}
