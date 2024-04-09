import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:politician_app/pages/gallery.dart';
import 'package:politician_app/pages/home.dart';
import 'package:politician_app/pages/news.dart';
import 'package:politician_app/pages/opinion.dart';
import 'package:politician_app/pages/vedios.dart';
import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 35, fontWeight: FontWeight.w900);
  static const List _widgetOptions = [

    Home(),
    news(),
    vedios(),
    gallery(),
    opinion(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: Colors.grey,),
            label: 'Home',
            activeIcon: Icon(Icons.home,
              color: Colors.lightBlueAccent,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded,color: Colors.grey,),
            label: 'News',
            activeIcon: Icon(Icons.newspaper_rounded,
              color: Colors.lightBlueAccent,),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline_outlined,
              color: Colors.grey,),
            label: 'Vedios',
            activeIcon: Icon(Icons.play_circle_outline,
              color: Colors.lightBlueAccent,),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_back,color: Colors.grey,),
            label: 'Photos',
            activeIcon: Icon(Icons.photo_camera_back_outlined,
              color: Colors.lightBlueAccent,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box,color: Colors.grey,),
            label: 'Opinions',
            activeIcon: Icon(Icons.add_box,
              color: Colors.lightBlueAccent,),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[700],
        selectedFontSize: 17,
        selectedLabelStyle: TextStyle(fontStyle:FontStyle.normal,fontWeight:FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}
