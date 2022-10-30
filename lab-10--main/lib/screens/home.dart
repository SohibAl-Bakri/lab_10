// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab10/screens/adjective.dart';
import 'package:lab10/screens/sgin_in.dart';
import 'package:lab10/theme/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  @override
  void initState() {
    checkColor();
    background(userColor);
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: user.snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              centerTitle: true,
            ),
            body: isList == false
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: background(userColor)),
                    child: ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, i) {
                        var userInfo = snapshot.data!.docs[i];
                        return ListTile(
                          title: Text(userInfo['email']),
                          subtitle: Text(userInfo['role']),
                          leading: userInfo['role'] == 'Admin'
                              ? const Icon(Icons.admin_panel_settings_outlined)
                              : const Icon(Icons.person_outline),
                        );
                      },
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: background(userColor),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context, i) {
                        var userInfo = snapshot.data!.docs[i];
                        return ListTile(
                          title: Text(userInfo['email']),
                          subtitle: Text(userInfo['role']),
                          leading: userInfo['role'] == 'Admin'
                              ? const Icon(Icons.admin_panel_settings_outlined)
                              : const Icon(Icons.person_outline),
                        );
                      },
                    ),
                  ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
