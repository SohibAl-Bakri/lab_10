// ignore_for_file: non_constant_identifier_names, camel_case_types, use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab10/screens/adjective.dart';
import 'package:lab10/widgets/widgets.dart';

import 'sgin_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Email = TextEditingController();
    TextEditingController PassWord = TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          const Text("login"),
          addVertecailSpacing(50),
          CustomTextField(
              theController: Email,
              hint: "Email",
              visbleText: false,
              inputType: TextInputType.emailAddress),
          addVertecailSpacing(50),
          CustomTextField(
              theController: PassWord,
              hint: "password",
              visbleText: true,
              inputType: TextInputType.text),
          addVertecailSpacing(50),
          CustomElevatedBotton(
              theFunction: () async {
                try {
                  var authenticationObject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authenticationObject.signInWithEmailAndPassword(
                          email: Email.text, password: PassWord.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("signed in successfully"),
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdjectivePage(),
                      ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("The email address or password is wrong"),
                    ),
                  );
                }
              },
              theText: "login"),
          addVertecailSpacing(50),
          Row(
            children: [
              const Text("dont have account ?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sginup(),
                        ));
                  },
                  child: const Text("sgin up"))
            ],
          )
        ],
      ),
    );
  }
}
