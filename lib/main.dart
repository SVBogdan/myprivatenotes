import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myprivatenotes/constants/routes.dart';
import 'package:myprivatenotes/helpers/loading/loading_screen.dart';
import 'package:myprivatenotes/servicies/auth/bloc/auth_bloc.dart';
import 'package:myprivatenotes/servicies/auth/bloc/auth_event.dart';
import 'package:myprivatenotes/servicies/auth/bloc/auth_state.dart';
import 'package:myprivatenotes/servicies/auth/firebase_auth_provider.dart';
import 'package:myprivatenotes/views/forgot_password_view.dart';
import 'package:myprivatenotes/views/login_view.dart';
import 'package:myprivatenotes/views/notes/create_update_note_view.dart';
import 'package:myprivatenotes/views/register_view.dart';
import 'package:myprivatenotes/views/verify_emai_view.dart';
import 'package:myprivatenotes/views/notes/notes_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.purple),
    home: BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: const HomePage(),
    ),
    routes: {
      createOrUpdateNoteRoute: (context) => const CreateUpdateNewNoteView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen().show(
          context: context,
          text: state.loadingText ?? 'Please wait a moment',
        );
      } else {
        LoadingScreen().hide();
      }
    }, builder: (context, state) {
      if (state is AuthStateLoggedIn) {
        return const NotesView();
      } else if (state is AuthStateNeedsVerification) {
        return const VerifyEmailView();
      } else if (state is AuthStateLoggedOut) {
        return const LoginView();
      } else if (state is AuthStateForgotPassword) {
        return const ForgotPasswordView();
      } else if (state is AuthStateRegistering) {
        return const RegisterView();
      } else {
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      }
    });
  }
}
