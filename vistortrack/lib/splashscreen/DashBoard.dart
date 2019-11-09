import 'package:flutter/material.dart';
import 'Userinfo/Userdetails.dart';

class Dashboard extends StatefulWidget {
  final UserDetail data;

  Dashboard({Key key, this.data}) : super(key: key);
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = '${widget.data.user}';
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

    final visitorcard = Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
                  child: Icon(
                Icons.image,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text("Visitor",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: 'Jose')),
              )
            ],
          ),
        ),
      ),
    );
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 6.0),
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
        backgroundImage: ExactAssetImage('assets/abc.jpg'),
        minRadius: 36,
        maxRadius: 36,
      ),
    );

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(36.0, 16.0, 16.0, 16.0),
      child: Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 10.0,
                  ),
                  new Text(
                    username,
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontFamily: 'Jose',
                        fontSize: 18.0),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  new Text(
                    "Android",
                    style: TextStyle(
                        color: Colors.grey, fontFamily: 'Jose', fontSize: 12.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    // TODO: implement build
    return Scaffold(
      body: SafeArea(
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
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 0.0,
                      horizontal: 24.0,
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[planetCardContent, planetThumbnail],
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
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(3.0),
                      children: <Widget>[
                        visitorcard,
                        visitorcard,
                        visitorcard,
                        visitorcard,
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
