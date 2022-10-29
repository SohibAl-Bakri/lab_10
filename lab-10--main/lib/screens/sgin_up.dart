// ignore_for_file: unused_local_variable, use_build_context_synchronously, non_constant_identifier_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab10/screens/sgin_in.dart';

import '../widgets/widgets.dart';

class Sginup extends StatefulWidget {
   Sginup({super.key});

  String chosenColor = "white";

  @override
  State<Sginup> createState() => _SginupState();
}

class _SginupState extends State<Sginup> {
  @override
  Widget build(BuildContext context) {
    List? colors = [
      "White",
      "Red",
      "Blue",
      "Yellow",
      "green",
      "Red And Blue",
      "Rainbow",
    ];
    String chosenColor = '';
    TextEditingController PassWord = TextEditingController();
    TextEditingController Email = TextEditingController();

    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return Scaffold(
          body: ListView(
            children: [
              const Text("sgin up"),
              addVertecailSpacing(50),
              CustomTextField(
                theController: Email,
                hint: "Email",
                visbleText: false,
                inputType: TextInputType.emailAddress,
              ),
              addVertecailSpacing(50),
              CustomTextField(
                theController: PassWord,
                hint: "password",
                visbleText: true,
                inputType: TextInputType.text,
              ),
              addVertecailSpacing(50),
              DropdownButton(
                value: chosenColor,
                items: colors
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(
                    () {
                      chosenColor = value.toString();
                    },
                  );
                },
              ),
              addVertecailSpacing(50),
              CustomElevatedBotton(
                  theFunction: () async {
                    try {
                      var authenticationObject = FirebaseAuth.instance;
                      UserCredential myUser = await authenticationObject
                          .createUserWithEmailAndPassword(
                              email: Email.text, password: PassWord.text);
                      saveAcount(color: chosenColor, email: Email.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("signed up successfully"),
                        ),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("The email address or password is wrong"),
                        ),
                      );
                    }
                  },
                  theText: "sgin up"),
              addVertecailSpacing(50),
              Row(
                children: [
                  const Text("already have account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
                    child: const Text("sgin in"),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future saveAcount({required String? color, required String? email}) async {
    User? user = FirebaseAuth.instance.currentUser;
    var userinfo = await FirebaseFirestore.instance
        .collection('user')
        .where("id", isEqualTo: user?.uid)
        .get();
    if (userinfo.docs.isEmpty) {
      final myUser =
          FirebaseFirestore.instance.collection('user').doc(user?.uid);

      final json = {
        'role': "user",
        'id': user?.uid,
        'color': color,
        'email': email,
      }; //to Create doucumant
      await myUser.set(json);
    }
  }
}
