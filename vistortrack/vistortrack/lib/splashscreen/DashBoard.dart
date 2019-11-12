import 'package:flutter/material.dart';
import 'Userinfo/Userdetails.dart';
import '../Visitor/visit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  final UserDetail data;

  Dashboard({Key key, this.data}) : super(key: key);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final username = '${widget.data.user}';

    /* Bottom Navigation Bar */
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

/**Visitor page navigation */
    void visitornavigate() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VisitorList()));
    }
/** CArd View Design */

    Widget visitorcard = Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: new InkWell(
            onTap: () => visitornavigate(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 20.0),
                Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.ac_unit),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .15),
                      child: CircleAvatar(
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 8.0),
                        ),
                        backgroundColor: Colors.red,
                        radius: 5.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text("Visitor",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.redAccent,
                          fontFamily: 'Jose')),
                ),
                SizedBox(height: 10.0),
                Container(
                  color: Colors.red,
                  width: 10.0,
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 1.0,
                ),
                SizedBox(height: 5.0),
                Text(
                  'this is test value',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 10.0),
                )
              ],
            ),
          ),
        ),
      ),
    );

    /* Profile Logo Design */
    final planetThumbnail = new Container(
      alignment: FractionalOffset.center,
      child: CircleAvatar(
        minRadius: 32,
        maxRadius: 32,
        backgroundColor: Colors.white,
        child: Container(
            width: 60,
            height: 60,
            // borde width
            decoration: new BoxDecoration(
                color: const Color(0xFFFFFFFF), // border color
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: ExactAssetImage('assets/abc.jpg')))),
      ),
    );

/** Profile info Design */
    final planetCardContent = new Container(
      //  width: MediaQuery.of(context).size.width * .90,
      // height: MediaQuery.of(context).size.height * .18,

      margin: new EdgeInsets.fromLTRB(36.0, 16.0, 16.0, 16.0),
      child: Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: new EdgeInsets.fromLTRB(40.0, 5.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 40.0,
                  ),
                  new Text(
                    username,
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Jose',
                        fontSize: 22.0),
                  ),
                  Container(
                    height: 6.0,
                  ),
                  new Text(
                    "Android Trainer",
                    style: TextStyle(
                        color: Colors.grey, fontFamily: 'Jose', fontSize: 14.0),
                  ),
                  Container(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        size: 12.0,
                      ),
                      new Text(
                        "You are at",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
/**Body */
    Widget body = SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
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
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Stack(
                                children: <Widget>[
                                  planetCardContent,
                                  planetThumbnail
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white30,
                width: MediaQuery.of(context).size.width * .75,
                height: 1.0,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                  child: Stack(
                    alignment: Alignment(0.0, 0.0),
                    children: <Widget>[
                      Center(
                        child: GridView.count(
                          crossAxisCount: 2,
                          padding: EdgeInsets.all(5.0),
                          children: <Widget>[
                            visitorcard,
                            visitorcard,
                            visitorcard,
                            visitorcard,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
    // TODO: implement build
    return Scaffold(body: body);
  }
}
