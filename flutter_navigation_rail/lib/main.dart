import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App2(),
    );
  }
}

class App2 extends StatefulWidget {
  @override
  _App2State createState() => _App2State();
}

class _App2State extends State<App2> {
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Navigation Rail"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            extended: true,
            selectedIndex: _selectIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectIndex = index;
              });
            },
            //labelType: NavigationRailLabelType.none,
            destinations: [
              NavigationRailDestination(
                icon: Icon(
                  Icons.favorite_border,
                ),
                selectedIcon: Icon(
                  Icons.favorite,
                ),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                selectedIcon: Icon(
                  Icons.book,
                ),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.star_border,
                ),
                selectedIcon: Icon(
                  Icons.star,
                ),
                label: Text('Third'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: Center(
              child: Text('selected Index:$_selectIndex'),
            ),
          )
        ],
      ),
    );
  }
}

class Extendable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          height: 56,
          padding: EdgeInsets.symmetric(
            vertical: lerpDouble(0, 6, animation.value),
          ), 
          child: animation.value == 0
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {},
                )
              : Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: animation.value,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: FloatingActionButton.extended(
                      icon: Icon(Icons.add),
                      label: Text('CREATE'),
                      onPressed: () {},
                    ),
                  ),
                ),
        );
      },
    );
  }
}
