import 'package:bottom_navigation/bottom.dart';
import 'package:bottom_navigation/samplepages.dart';
import 'package:flutter/material.dart';

import 'animation.dart';
import 'animation1.dart';
import 'bottomApbar.dart';
import 'new.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

  // class BottomMenu extends StatefulWidget{
  //   @override
  //   State<StatefulWidget> createState() {
  //       return _BottomMenuState();
  //   }

  // }
  // class _BottomMenuState extends State<BottomMenu>{
  // var _pagesDate =[HomePage(),AboutPage(),ServicesPage()];
  // int _selectedItem =0;
  //   @override
  //   Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text("Bottom App Menu")),
  //         body: Center(
  //           child: _pagesDate[_selectedItem],
  //         ),
  //         bottomNavigationBar: BottomNavigationBar(
  //           items: <BottomNavigationBarItem>[
  //             BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
  //             BottomNavigationBarItem(icon: Icon(Icons.info),label: "About"),
  //             BottomNavigationBarItem(icon: Icon(Icons.room_service),label: "Services"),
  //         ],
  //         currentIndex: _selectedItem,
  //         onTap: (setValue){
  //           setState(() {
  //             _selectedItem=setValue;
  //           });
  //         }
  //         ),
  //   );
  //   }

  // }











