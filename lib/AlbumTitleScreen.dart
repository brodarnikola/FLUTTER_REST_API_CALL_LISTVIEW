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
          '''I am Nguyen Duc Hoang, I live in Hanoi, Vietnam. I create this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, 
        ios and android programming, Kotlin programming, new technologies' overviews. 
        These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.
      ''',
          style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
    );



    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
                if (snapshot.hasData) {
                  return Text(snapshot.data.title);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            Image.asset('images/tutorialChannel.png', fit: BoxFit.cover),
            //You can add more widget bellow
            titleSection,
            fourButtonsSection,
            bottomTextSection,
            fourButtonsSection,
            bottomTextSection,

          ],
        ),
      ),
      //   body: Center(
      //     child: FutureBuilder<Album>(
      //       future: futureAlbum,
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return Text(snapshot.data.title);
      //         } else if (snapshot.hasError) {
      //           return Text("${snapshot.error}");
      //         }
      //
      //         // By default, show a loading spinner.
      //         return CircularProgressIndicator();
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  Widget buildButton(IconData icon, String buttonTitle) {
    final Color tintColor = Colors.blue;
    return new Column(
      children: <Widget>[
        new Icon(icon, color: tintColor),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(buttonTitle, style: new TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.w600, color: tintColor),),
        )
      ],
    );
  }

}
