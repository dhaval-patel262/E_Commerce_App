import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login/login_Screen.dart';
import 'package:shop_app/services/authProvider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus { notSignedIn, SignedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var auth = AuthProvider.of(context).auth;
    auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.SignedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginScreen(
          onSignedIn: _signedIn,
        );
    case AuthStatus.SignedIn:
    return HomeScreen(
      onSignedOut: _signedOut,
    );
    }
  }
}
