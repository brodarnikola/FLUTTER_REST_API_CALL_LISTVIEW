import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_number2/AlbumTitleScreen.dart';

class NavigationViewBottomNavigation extends StatefulWidget {
  @override
  _NavigationViewBottomNavigationState createState() =>
      _NavigationViewBottomNavigationState();
}

class _NavigationViewBottomNavigationState
    extends State<NavigationViewBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add from here...
      appBar: AppBar(
        centerTitle: true,
        title: Text('Navigation View'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart)),
          IconButton(icon: Icon(Icons.monetization_on)),
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
            Text("Item 4"),
            Text("Item 5"),
            Text("Item 6"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

}
