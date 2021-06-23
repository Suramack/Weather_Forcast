import 'package:flutter/material.dart';
import 'package:wheather_forcast/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _width, _height;
  int _selectedBottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    List<Widget> _widgetList = <Widget>[
      Weather(),
      Text('Search'),
      Text('Profile'),
    ];
    void _onTapIndex(int index) {
      setState(() {
        _selectedBottomIndex = index;
      });
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: _selectedBottomIndex,
          onTap: _onTapIndex,
          elevation: 5,
        ),
        drawer: Container(
          padding: EdgeInsets.only(top: 25.0),
          child: Drawer(
            child: Column(
              children: [
                Container(
                  child: SizedBox(
                    height: _height * .25,
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                    ),
                    highlightColor: Colors.yellow,
                    color: Colors.grey[700],
                    onPressed: (() {}),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[900],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Weather',
          ),
        ),
        body: Center(
          child: _widgetList.elementAt(_selectedBottomIndex),
        ));
  }
}
