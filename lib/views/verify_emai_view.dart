import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprivatenotes/constants/routes.dart';
import 'package:myprivatenotes/servicies/auth/auth_service.dart';
import 'package:myprivatenotes/servicies/auth/bloc/auth_bloc.dart';
import 'package:myprivatenotes/servicies/auth/bloc/auth_event.dart';

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
              context.read<AuthBloc>().add(
                    const AuthEventSendEmailVerification(),
                  );
            },
            child: const Text('Send email verification')),
        TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(
                    const AuthEventLogOut(),
                  );
            },
            child: const Text('Restart'))
      ]),
    );
  }
}
