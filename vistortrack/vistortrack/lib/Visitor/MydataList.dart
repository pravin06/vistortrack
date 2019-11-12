import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vistortrack/models/products.dart';

class MyDataView extends StatefulWidget {
  @override
  VisitListDataState createState() => VisitListDataState();
}

class VisitListDataState extends State<MyDataView> {
  List<Product> _beers = List<Product>();
  List<Product> _beersdisplay = List<Product>();
  bool _isloding = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listenForBeers();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var futureBuilder = new FutureBuilder(
      future: getdata(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(222, 222, 222, 0.3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(),
                  ],
                ));
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, _beers);
        }
      },
    );

    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              searchdata(),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                    child: _isloding
                        ? createListView(context, _beersdisplay)
                        : Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 10.0,
                              height: 10.0,
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                          )),
              )

              // _isloding ? futureBuilder : CircularProgressIndicator()
            ],
          )
        ],
      ),
    );
  }

  Future getdata() async {
    //listenForBeers();

    return _beers;
  }

  listenForBeers() async {
    final Stream<Product> stream = await getBeers();
    stream.listen((Product beer) => setState(() {
          _beers.add(beer);
          _beersdisplay = _beers;
        }));
    _isloding = true;
    return _beers;
  }

  final _email = TextField(
    obscureText: false,
    keyboardType: TextInputType.text,
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
  searchdata() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        obscureText: false,
        keyboardType: TextInputType.text,
        style:
            TextStyle(fontFamily: 'Jose', fontSize: 16.0, color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white54,
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 0.5),
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: "Search College",
          hintStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20.7),
          ),
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _beersdisplay = _beers.where((note) {
              var productt = note.name.toLowerCase();
              return productt.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  createListView(BuildContext context, List<Product> beers) {
    ScrollController _controller = new ScrollController();
    List<Product> values = beers;
    // print("---" + values.toString());
    return ListView.separated(
      itemCount: values.length,
      shrinkWrap: true,
      controller: _controller,
      itemBuilder: (context, index) {
        return listdata(index, values, context);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

listdata(
  int index,
  List<Product> values,
  BuildContext context,
) {
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
          print(values[index]);
        },
        trailing: CircleAvatar(
          backgroundImage: NetworkImage(values[index].image_url),
          radius: MediaQuery.of(context).size.height * .03,
        ),
        title: Text(
          values[index].name,
          style: TextStyle(
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text('this is test data'),
      ),
    ),
  );
}
