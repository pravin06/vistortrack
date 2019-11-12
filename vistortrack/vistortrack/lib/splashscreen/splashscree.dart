import 'package:flutter/material.dart';
import 'dart:async';
import 'UsersChoice.dart';

class SpalshScreen extends StatefulWidget {
  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<SpalshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6), () => _navigatepage());
  }

  void _navigatepage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserOption()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          maxRadius: 48.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.all_inclusive,
                            size: 48.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Visitor Tracking',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 24.0,
                              fontFamily: 'Jose',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        Text(
                          'Eyeopen Technologies',
                          style:
                              TextStyle(fontSize: 10.0, color: Colors.white24),
                        ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    ));
  }
}
