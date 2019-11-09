import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final test = Text(
    'User Login',
    style: TextStyle(color: Colors.white),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: ListView(
          children: <Widget>[test],
        ),
      ),
    );
  }
}
