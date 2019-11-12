import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class VistorSingle extends StatefulWidget {
  @override
  VisitorSingleState createState() => VisitorSingleState();
}

class VisitorSingleState extends State<VistorSingle> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  flutterlocalnotification = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
          actions: <Widget>[
            
          ],
        );
      },
    );
  }

// Method 3
  Future _showNotificationWithoutSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        playSound: false, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.location_on),
          label: Text('View On Map'),
          onPressed: () {
            print('notify');
            _showNotificationWithoutSound();
          },
        ),
      ),
    );
  }
}
