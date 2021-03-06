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
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
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
        ),
      ),
    );
  }
}