import 'package:flutter/material.dart';

class MyDataView extends StatefulWidget {
  @override
  MyDataViewState createState() => MyDataViewState();
}

class MyDataViewState extends State<MyDataView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Appointment Page'),
          SizedBox(
            height: 20.0,
          ),
        
        ],
      ),
    );
  }
}
