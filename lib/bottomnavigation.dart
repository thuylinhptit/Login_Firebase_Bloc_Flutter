import 'package:bloc_login/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget{
  @override
  _BottomNavigation createState() => _BottomNavigation();
  
}

class _BottomNavigation extends State<BottomNavigation>{
  var _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Center(
      child: HomeScreen(),
    ),
    Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Stats", style: TextStyle( color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text("Completed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              Text("Incompleted", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
            ],
          ),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('Todos', style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              title: Text('Stats', style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        onTap: _onTapItem,
      ),
    );
  }
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
}