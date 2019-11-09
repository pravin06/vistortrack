import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'LoginPage.dart';

class UserOption extends StatelessWidget {
  void _userlogin() {
    print('Login Executed');
  }

  Widget _userschoice(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.redAccent),
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
                            ButtonTheme(
                              buttonColor: Colors.red,
                              height: 50.0,
                              minWidth: 300.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.assignment_ind,
                                  color: Colors.red,
                                ),
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                label: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Jose',
                                    color: Color.fromRGBO(38, 38, 38, 0.4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                  height: 1.0,
                                  width: 50.0,
                                  color: Colors.white30,
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                                new Container(
                                  child: Text(
                                    'or',
                                    style: TextStyle(color: Colors.white30),
                                  ),
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                                new Container(
                                  height: 1.0,
                                  width: 50.0,
                                  color: Colors.white30,
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonTheme(
                              buttonColor: Colors.red,
                              height: 50.0,
                              minWidth: 300.0,
                              child: FlatButton.icon(
                                icon: Icon(
                                  Icons.assignment_ind,
                                  color: Colors.red,
                                ),
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                onPressed: () {},
                                label: Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Jose',
                                    color: Color.fromRGBO(38, 38, 38, 0.4),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _userschoice(context);
  }
}
