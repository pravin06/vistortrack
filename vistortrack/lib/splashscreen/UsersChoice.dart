import 'package:flutter/material.dart';

class UserOption extends StatelessWidget {
  Widget _userschoice() {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton.icon(
                            icon: Icon(Icons.assignment_ind),
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            onPressed: () {},
                            label: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w200,
                                fontFamily: 'Jose',
                                color: Color.fromRGBO(38, 38, 38, 0.4),
                              ),
                            ),
                          )
                        ],
                      ))),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _userschoice();
  }
}
