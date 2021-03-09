import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_number2/NavigationViewBottomNavigation.dart';
import 'package:flutter_app_number2/SelectedWords.dart';
import 'package:flutter_app_number2/SplitScreenAndDragDrop.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  //final List<WordPair> _suggestions = <WordPair>[];

  final _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        centerTitle: true,
        title: Text('Startup Name Generator5'),
        actions: [
          IconButton(
              icon: Icon(Icons.list), onPressed: startSelectedWordsScreen),
          IconButton( icon: Icon(Icons.ac_unit), onPressed: startNavigationViewBottomNavigationScreen, )
        ],
      ),
      body: ListView(
        children: [titleSection, buildSuggestions()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationToSplitScreenByPercentageAndDragDropExample();
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget titleSection = new Container(
    height: 89,
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

  void navigationToSplitScreenByPercentageAndDragDropExample() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExampleDragAndDrop()),
    );
  }

  // left here just as a example, draw screen inside screen
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Saved Suggestions'),
              actions: [
                IconButton(
                    icon: Icon(Icons.list) /*, onPressed: startNewScreen*/),
              ],
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  void startSelectedWordsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectedWords(selectedWords: _saved)),
    );
  }

  void startNavigationViewBottomNavigationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NavigationViewBottomNavigation()),
    );
  }

  Widget buildSuggestions() {
    return Wrap(children: <Widget>[
      Container(
          height: 500,
          child: ListView.builder(
              padding: const EdgeInsets.all(16),
              // The itemBuilder callback is called once per suggested
              // word pairing, and places each suggestion into a ListTile
              // row. For even rows, the function adds a ListTile row for
              // the word pairing. For odd rows, the function adds a
              // Divider widget to visually separate the entries. Note that
              // the divider may be difficult to see on smaller devices.
              itemBuilder: (BuildContext _context, int i) {
                // Add a one-pixel-high divider widget before each row
                // in the ListView.
                if (i.isOdd) {
                  return Divider();
                }

                // The syntax "i ~/ 2" divides i by 2 and returns an
                // integer result.
                // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
                // This calculates the actual number of word pairings
                // in the ListView,minus the divider widgets.
                final int index = i ~/ 2;
                // If you've reached the end of the available word
                // pairings...
                if (index >= _suggestions.length) {
                  // ...then generate 10 more and add them to the
                  // suggestions list.
                  _suggestions.addAll(generateWordPairs().take(10));
                }
                return _buildRow(_suggestions[index]);
              }))
    ]);
  }

  // Widget buildSuggestions() {
  //   return Container(
  //       child: Wrap(
  //           direction: Axis.vertical,
  //           children: [
  //         ListView.builder(
  //             padding: const EdgeInsets.all(16),
  //             // The itemBuilder callback is called once per suggested
  //             // word pairing, and places each suggestion into a ListTile
  //             // row. For even rows, the function adds a ListTile row for
  //             // the word pairing. For odd rows, the function adds a
  //             // Divider widget to visually separate the entries. Note that
  //             // the divider may be difficult to see on smaller devices.
  //             itemBuilder: (BuildContext _context, int i) {
  //               // Add a one-pixel-high divider widget before each row
  //               // in the ListView.
  //               if (i.isOdd) {
  //                 return Divider();
  //               }
  //
  //               // The syntax "i ~/ 2" divides i by 2 and returns an
  //               // integer result.
  //               // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
  //               // This calculates the actual number of word pairings
  //               // in the ListView,minus the divider widgets.
  //               final int index = i ~/ 2;
  //               // If you've reached the end of the available word
  //               // pairings...
  //               if (index >= _suggestions.length) {
  //                 // ...then generate 10 more and add them to the
  //                 // suggestions list.
  //                 _suggestions.addAll(generateWordPairs().take(10));
  //               }
  //               return _buildRow(_suggestions[index]);
  //             })
  //       ]));
  // }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        // NEW from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.blue : null,
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
