import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_number2/AlbumTitleScreen.dart';

class SelectedWords extends StatefulWidget {

  final Set<WordPair> selectedWords;
  SelectedWords({Key key, this.selectedWords}) : super(key: key);

  @override
  _SelectedWordsState createState() => _SelectedWordsState();
}

class _SelectedWordsState extends State<SelectedWords> {

  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        centerTitle: true,
        title: Text('Startup Name Generator5'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: startNewScreen),
        ],
      ),
      body: ListView(children: _buildSuggestions()),
    );
  }

  void startNewScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  List<Widget> _buildSuggestions() {

    final tiles = widget.selectedWords.map(
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

    return divided;
  }

}
