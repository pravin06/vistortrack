import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../Visitor/visitList.dart';
import '../Visitor/appointmentList.dart';
import '../Visitor/MydataList.dart';

class VisitorList extends StatefulWidget {
  @override
  VisitorListState createState() => VisitorListState();
}

class VisitorListState extends State<VisitorList> {
  TextStyle style =
      TextStyle(fontFamily: 'Jose', fontSize: 16.0, color: Colors.green);
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _text = TextEditingController();
  final _textpassword = TextEditingController();
  bool _validate = false;
  bool _showpass = false;
  int countpos = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  int correntindex = 0;
  getcurrentindex() {
    switch (correntindex) {
      case 0:
        return VisitListDataView();
        break;
      case 1:
        return AppointmentDataView();
        break;
      case 2:
        return MyDataView();
        break;
    }
  }

  setcorrentindex(int index) {
    setState(() {
      correntindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CurvedNavigationBar _cbr = CurvedNavigationBar(
      key: _bottomNavigationKey,
      items: <Widget>[
        Icon(Icons.add, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.compare_arrows, size: 30),
        Icon(Icons.accessibility, size: 30),
      ],
      animationCurve: Curves.easeIn,
      buttonBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 1000),
      backgroundColor: Colors.red[800],
      onTap: (index) {
        setState(() {
          countpos = index;
          setcorrentindex(index);
          print(index);
        });
      },
    );

    BottomNavigationBar _bar = BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          title: new Text('Messages'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile'))
      ],
    );

    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: _cbr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.red[400],
                  Colors.red[600],
                  Colors.red[700],
                  Colors.red[800],
                ]),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: getcurrentindex(),
          ),
        ),
      ),
    );
  }
}
