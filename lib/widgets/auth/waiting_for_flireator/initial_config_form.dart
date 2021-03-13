import 'package:flutter/material.dart';

class InitialConfigForm extends StatefulWidget {
  InitialConfigForm({Key? key}) : super(key: key);

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  _InitialConfigFormState createState() => _InitialConfigFormState();
}

class _InitialConfigFormState extends State<InitialConfigForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (widget._formKey.currentState != null &&
                    widget._formKey.currentState!.validate()) {
                  // If the form is valid, display a Snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
