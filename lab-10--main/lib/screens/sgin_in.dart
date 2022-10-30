// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_local_variable, use_build_context_synchronously, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab10/screens/adjective.dart';
import 'package:lab10/widgets/widgets.dart';

import 'sgin_up.dart';

String? userColor;
void checkColor() async {
  User? user = FirebaseAuth.instance.currentUser;
  DocumentSnapshot userInfo =
      await FirebaseFirestore.instance.collection('user').doc(user?.uid).get();
  String userRole = userInfo['color'];
  userColor = userRole;
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController Email = TextEditingController();
  TextEditingController PassWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
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
                    checkColor();
                    print(userColor);
                    print(List);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdjectivePage(),
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
                            builder: (context) => const Sginup(),
                          ));
                    },
                    child: const Text("sgin up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
