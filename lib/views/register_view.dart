
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myprivatenotes/firebase_options.dart';
import 'package:myprivatenotes/views/login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {


  late final TextEditingController _email;
  late final TextEditingController _password;

@override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register view'),
        ),
      body: Column(
            children: [
              TextField(
                controller: _email,
                 decoration: 
                const InputDecoration(
                  hintText: 'Please enter your email'
                ),
                enableSuggestions: false,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
              ),
              TextField(
                controller:_password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: 
                const InputDecoration(
                  hintText: 'Please enter your password'
                ),
              ),
              TextButton(
                onPressed: () async {
                  
                  final email = _email.text;
                  final password = _password.text;
                  try{
                      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, 
                    password: password,
                    );
                    print(userCredential);
                  } on FirebaseAuthException catch(e){
                      if(e.code == 'weak-password'){
                        print('Weak Password');
                      } else if(e.code =='email-already-in-use'){
                        print('This email is already used');
                      } else if(e.code == 'invalid-email'){
                        print('Invalid Email');
                      }
                      
                  }
                  
                },
                child: const Text('Register') ),
                TextButton(onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login/', 
                    (route) => false);
                }, 
                  child: const Text('Already Registered? Login here'),
                  )
            ],
          ),
    );
  }
}