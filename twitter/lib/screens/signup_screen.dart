import 'package:flutter/material.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  // Create stateful widget including build context
  // Not mounted yet - just calls build with state encapsulated
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  // Define property types
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  final _formKey = GlobalKey<FormState>();

  @override
  @mustCallSuper
  void initState() {
    // Initializes state and mounts - data, properties
    // Subscribes to state changes
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  @mustCallSuper
  void dispose() {
    // Permanently remove everything at end of lifecycle (after unmount)
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Similar to render in React- called when updated, returns widget
    // Rebuilds widget when state (name, email, password, confirm) changes and outdates updated values
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                // // Specifically asked to give height of 88 but overflows container
                //   height: 88,
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 35, 0, 100),
                            child: Text(
                              'Sign Up',
                              // Default theme text style, but theme changed from gray
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color:
                                          Theme.of(context).primaryColorDark),
                            )),
                        CustomEntryField(
                          hint: 'Enter name',
                          controller: _nameController,
                          isPassword: false,
                        ),
                        CustomEntryField(
                          hint: 'Enter email',
                          controller: _emailController,
                          isPassword: false,
                        ),
                        CustomEntryField(
                          hint: 'Enter password',
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        CustomEntryField(
                          hint: 'Confirm Password',
                          controller: _confirmController,
                          isPassword: true,
                        ),
                        CustomFlatButton(
                          onPressed: initState,
                          label: 'Sign up',
                        ),
                      ],
                    )))));
  }
}
