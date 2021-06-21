import 'package:flutter/material.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';
import 'package:moony_nav_bar_example/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _screen1 = Screen1();
  Widget _screen2 = Screen2();
  Widget _screen3 = Screen3();
  Widget _screen4 = Screen4();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Moony navigation bar'),
        ),
        body: getBody(),
        bottomNavigationBar: MoonyNavigationBar(
          // Usar -> "BottomNavigationDotBar"
          items: <NavigationBarItem>[
            NavigationBarItem(
                icon: Icons.home,
                onTap: () {
                  onTapHandler(0);
                }),
            NavigationBarItem(
                icon: Icons.favorite_border_outlined,
                onTap: () {
                  onTapHandler(1);
                }),
            NavigationBarItem(
                icon: Icons.search,
                onTap: () {
                  onTapHandler(2);
                }),
            NavigationBarItem(
                icon: Icons.person_outline,
                onTap: () {
                  onTapHandler(3);
                })
          ],
          style: MoonyNavStyle(
            activeColor: Theme.of(context).primaryColor
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._screen1;
    } else if (this.selectedIndex == 1) {
      return this._screen2;
    } else if (this.selectedIndex == 2) {
      return this._screen3;
    }
    return this._screen4;
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
