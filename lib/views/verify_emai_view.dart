import 'package:flutter/material.dart';
import 'package:myprivatenotes/constants/routes.dart';
import 'package:myprivatenotes/servicies/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify email')),
      body: Column(children: [
        const Text(
            "We've sent you a verification email.Please open it to verify your account"),
        const Text(
            "If you haven't recieved a verification email please press the button below"),
        TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerirfication();
            },
            child: const Text('Send email verification')),
        TextButton(
            onPressed: () async {
              AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'))
      ]),
    );
  }
}
