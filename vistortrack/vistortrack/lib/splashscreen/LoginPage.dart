import 'package:flutter/material.dart';
import 'DashBoard.dart';
import 'Userinfo/Userdetails.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextStyle style =
      TextStyle(fontFamily: 'Jose', fontSize: 16.0, color: Colors.green);
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _text = TextEditingController();
  final _textpassword = TextEditingController();
  bool _validate = false;
  bool _showpass = false;
  @override
  Widget build(BuildContext context) {
    final _email = TextFormField(
      obscureText: false,
      controller: _text,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontFamily: 'Jose', fontSize: 16.0, color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          color: Colors.white54,
        ),
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.5),
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(20.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20.7),
        ),
      ),
    );
    final passwordField = TextFormField(
      obscureText: _showpass ? false : true,
      controller: _textpassword,
      style: TextStyle(fontFamily: 'Jose', fontSize: 16.0, color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        prefixIcon: new IconButton(
          onPressed: () {
            setState(() {
              if (_showpass) {
                _showpass = false;
                print("false :" + _showpass.toString());
              } else {
                _showpass = true;
                print("true :" + _showpass.toString());
              }
            });
          },
          icon: _showpass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          color: Colors.white54,
        ),
        fillColor: Color.fromRGBO(255, 255, 255, 0.5),
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      maxRadius: 48.0,
      child: Icon(
        Icons.all_inclusive,
        color: Colors.white70,
        size: 48.0,
      ),
    );
    final loginButon = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (_text.text.length <= 0 || _textpassword.text.length <= 0) {
            scaffoldKey.currentState.showSnackBar(
                new SnackBar(content: new Text("Enter the Minimum 1 Value")));
          } else if (_textpassword.text.length > 32 ||
              _textpassword.text.length <= 5) {
            scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: new Text("Enter the Password between 6-32")));
          } else {
            final data = UserDetail(
                user: _text.text.toString(),
                userpass: _textpassword.text.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (conetxt) => Dashboard(
                        data: data,
                      ),
                ));
          }
        },
        child: Text("Connect",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.red[400],
              Colors.red[600],
              Colors.red[700],
              Colors.red[800],
            ])),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          logo,
                          SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Jose',
                                    fontSize: 12.0),
                              ),
                            ),
                          ),
                          _email,
                          SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Jose',
                                    fontSize: 12.0),
                              ),
                            ),
                          ),
                          passwordField,
                          SizedBox(
                            height: 30.0,
                          ),
                          loginButon
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
