import 'package:flutter/material.dart';
import 'package:flutter_app_number2/remote/webservices/Webservices.dart';
import 'dart:async';
import 'remote/model/Album.dart';

class AlbumTitleScreen extends StatefulWidget {
  AlbumTitleScreen({Key key}) : super(key: key);

  @override
  _AlbumTitleScreenState createState() => _AlbumTitleScreenState();
}

class _AlbumTitleScreenState extends State<AlbumTitleScreen> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Programming tutorials Channel",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "This channel contains tutorial videos in Flutter, "
                  "React Native, React, Angular",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(
            " 100",
            style: new TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          buildButton(Icons.home, "Home"),
          buildButton(Icons.arrow_back, "Back"),
          buildButton(Icons.arrow_forward, "Next"),
          buildButton(Icons.share, "Share"),
        ],
      ),
    );

    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text(
          '''I am Nikola Brodar, I live in Mali Mihaljevec, Croatia. I have created this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, 
        ios and android programming, Kotlin programming, new technologies' overviews. 
        These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.
      ''',
          style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
    );

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: ListView(
          children: [
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                List<Widget> children;
                if ( snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  children = <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 60,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Text(
                          'Title: ${snapshot.data.title} \nId: ${snapshot.data.id}'),
                    )
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                } else {
                  children = <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        width: 50,
                        height: 50,
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text('Awaiting result...'),
                    )
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
            Image.asset('images/lion.jpg', fit: BoxFit.cover),
            //You can add more widget bellow
            titleSection,
            fourButtonsSection,
            bottomTextSection,
            fourButtonsSection,
            bottomTextSection,
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String buttonTitle) {
    final Color tintColor = Colors.blue;
    return new Column(
      children: <Widget>[
        new Icon(icon, color: tintColor),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(
            buttonTitle,
            style: new TextStyle(
                fontSize: 16.0, fontWeight: FontWeight.w600, color: tintColor),
          ),
        )
      ],
    );
  }
}
