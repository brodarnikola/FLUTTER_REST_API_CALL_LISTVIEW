import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app_number2/AlbumTitleScreen.dart';
import 'package:flutter_app_number2/view/layout_example/LinearLayoutScreen.dart';

class NavigationViewBottomNavigation extends StatefulWidget {
  @override
  _NavigationViewBottomNavigationState createState() =>
      _NavigationViewBottomNavigationState();
}

class _NavigationViewBottomNavigationState
    extends State<NavigationViewBottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget firstRow = Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Programming tutorials Channel",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                Text(
                  "This channel contains tutorial videos in Flutter, "
                  "React Native, React, Angular",
                  style: TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
          Icon(Icons.favorite, color: Colors.red),
          Text(
            " 100",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );

    Widget secondRow = Container(
        color: Colors.red,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
              flex: 4,
            ),
            Expanded(
              child: Container(
                child: Icon(
                  Icons.access_time,
                  size: 50.0,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                child: Icon(
                  Icons.pie_chart,
                  size: 100.0,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                  child: Icon(
                Icons.email,
                size: 50.0,
              )),
              flex: 2,
            ),
          ],
        ));

    Widget thirdRow = Container(
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Icon(
              Icons.access_time,
              size: 50.0,
            ),
            Icon(
              Icons.pie_chart,
              size: 100.0,
            ),
            Icon(
              Icons.email,
              size: 50.0,
            )
          ],
        ));

    Widget fourthRow = Container(
        color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Icon(
              Icons.access_time,
              size: 50.0,
            ),
            Icon(
              Icons.pie_chart,
              size: 100.0,
            ),
            Icon(
              Icons.email,
              size: 50.0,
            )
          ],
        ));

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
      body: ListView(children: [
        firstRow,
        secondRow,
        thirdRow,
        fourthRow,
      ]),

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToLayoutExampleScreen();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void navigateToLayoutExampleScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LinearLayoutScreen()),
    );
  }


}
