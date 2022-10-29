import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab10/screens/home.dart';
import 'package:lab10/theme/app_color.dart';

class AdjectivePage extends StatefulWidget {
  const AdjectivePage({super.key});

  static String group = '';

  @override
  State<AdjectivePage> createState() => _AdjectivePageState();
}

class _AdjectivePageState extends State<AdjectivePage> {
  @override
  bool isList = false;

  background(String? color) {
    if (color == 'White') {
      isList = false;

      return AppColors.white;
    }
    if (color == 'Red') {
      isList = false;

      return AppColors.red;
    }
    if (color == 'Blue') {
      isList = false;

      return AppColors.blue;
    }
    if (color == 'Yellow') {
      isList = false;

      return AppColors.yellow;
    }
    if (color == 'green') {
      isList = false;

      return AppColors.green;
    }
    if (color == 'Red And Blue') {
      isList = true;

      return AppColors.redAndBlue;
    }
    if (color == 'Rainbow') {
      isList = true;

      return AppColors.reinbow;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjective'),
        centerTitle: true,
      ),
      body: isList == false
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: background(HomePage.userColor),
              ),
              child: const Body(),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: background(HomePage.userColor),
                ),
              ),
              child: const Body(),
            ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text('Please Select Your Adjective'),
          ),
          const SizedBox(height: 20),
          RadioListTile(
            value: 'User',
            groupValue: AdjectivePage.group,
            title: const Text('User'),
            onChanged: (value) {
              setState(() {
                AdjectivePage.group = value.toString();
              });
              var role = FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid);

              role.update({
                'role': value.toString(),
              });
            },
          ),
          RadioListTile(
            value: 'Admin',
            groupValue: AdjectivePage.group,
            title: const Text('Admin'),
            onChanged: (value) {
              setState(() {
                AdjectivePage.group = value.toString();
              });
              var role = FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid);

              role.update({
                'role': value.toString(),
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            },
            child: const Text('Enter'),
          ),
        ],
      ),
    );
  }
}
