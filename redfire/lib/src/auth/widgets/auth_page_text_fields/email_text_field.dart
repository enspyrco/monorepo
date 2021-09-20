import 'package:flutter/material.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/actions/email/get_providers_for_email_action.dart';
import 'package:redfire/src/redux/extensions/build_context_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';

class EmailTextField<T extends RedFireState> extends StatefulWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailTextField<T>> createState() => _EmailTextFieldState<T>();
}

class _EmailTextFieldState<T extends RedFireState>
    extends State<EmailTextField<T>> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    RedFireLocator.provideEmailTextFieldController(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        controller: _controller,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration.collapsed(
            hintText: 'enter email',
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey[900],
            filled: true),
        onSubmitted: (email) =>
            context.dispatch<T>(GetProvidersForEmailAction(email)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    RedFireLocator.provideEmailTextFieldController(null);
    super.dispose();
  }
}
