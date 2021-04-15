import 'package:flutter/material.dart';
import 'package:flutter_instagram_clon/tap_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_instagram_clon/login_Page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return TabPage(snapshot.data);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
