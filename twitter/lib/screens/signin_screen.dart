import 'package:flutter/material.dart';
import '../widgets/entry_field.dart';
import '../widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  @mustCallSuper
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          margin: const EdgeInsets.only(top: 75),
          child: SingleChildScrollView(
            child: Center(
                child: Column(
      children: [
        Text(
          'Sign In',
          // Default theme text style, but theme changed from gray
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
        CustomEntryField(
          hint: 'Email',
          controller: _emailController,
          isPassword: false,
        ),
        CustomEntryField(
          hint: 'Password',
          controller: _passwordController,
          isPassword: true,
        ),
        CustomFlatButton(
          onPressed: initState,
          label: 'Submit',
        ),
        Text(
          'Sign up',
          // Default theme text style, but theme changed from gray
          style: Theme.of(context)
              .textTheme
              .bodyText1!.copyWith(color: Theme.of(context).primaryColor),
        ),
        Text(
          'Forgot password?',
          // Default theme text style, but theme changed from gray
          style: Theme.of(context)
              .textTheme
              .bodyText1!.copyWith(color: Theme.of(context).primaryColor),
        ),
      ],
    )))));
  }
}
