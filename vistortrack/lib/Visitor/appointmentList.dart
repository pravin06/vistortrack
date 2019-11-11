import 'package:flutter/material.dart';

class AppointmentDataView extends StatefulWidget {
  @override
  AppointmentDataState createState() => AppointmentDataState();
}

class AppointmentDataState extends State<AppointmentDataView> {
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
          _myListView(context)
        ],
      ),
    );
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  ScrollController _controller = new ScrollController();
  // backing data
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  return ListView.separated(
    itemCount: europeanCountries.length,
    shrinkWrap: true,
    controller: _controller,
    itemBuilder: (context, index) {
      return Card(
        child: InkWell(
          onTap: () {
            print('test');
          },
          child: ListTile(
            onTap: () {
              print('jhkjh');
            },
            onLongPress: () {
              print(europeanCountries[index]);
            },
            leading: Icon(Icons.wb_sunny),
            trailing: CircleAvatar(
              minRadius: MediaQuery.of(context).size.height * .04,
              backgroundColor: Colors.red,
              child: Text('$index'),
              maxRadius: MediaQuery.of(context).size.height * .04,
            ),
            title: Text(europeanCountries[index]),
            subtitle: Text('this is test data'),
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}
