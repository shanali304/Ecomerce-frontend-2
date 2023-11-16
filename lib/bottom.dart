// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:bottom_navigation/samplepages.dart';
// import 'package:flutter/material.dart';

//  class BottomMenu extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//       return _BottomMenuState();
//   }

// }
// class _BottomMenuState extends State<BottomMenu>{
//  var _pagesDate =[HomePage(),AboutPage(),ServicesPage()];
//  int _selectedItem =0;
//    final iconList = <IconData>[
//     Icons.brightness_5,
//     Icons.brightness_4,
//     Icons.brightness_6,
//     Icons.brightness_7,
//   ];
//    var _bottomNavIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//       return Scaffold(
//    body: Container(), //destination screen
//    floatingActionButton: FloatingActionButton(onPressed: () {  HomePage();AboutPage();ServicesPage();},
//       //params
//    ),
//    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//    bottomNavigationBar: AnimatedBottomNavigationBar(
//       icons: iconList,
//       activeIndex: _bottomNavIndex,
//       gapLocation: GapLocation.center,
//       notchSmoothness: NotchSmoothness.verySmoothEdge,
//       leftCornerRadius: 32,
//       rightCornerRadius: 32,
//       onTap: (index) => setState(() => _bottomNavIndex = index),
//       //other params
//    ),
// );
//   }


// }
//   //  return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text("Bottom App Menu")),
//   //       body: Center(
//   //         child: _pagesDate[_selectedItem],
//   //       ),
//   //       bottomNavigationBar: BottomNavigationBar(
//   //         items: <BottomNavigationBarItem>[
//   //           BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
//   //           BottomNavigationBarItem(icon: Icon(Icons.info),label: "About"),
//   //           BottomNavigationBarItem(icon: Icon(Icons.room_service),label: "Services"),
//   //       ],
//   //       currentIndex: _selectedItem,
//   //       onTap: (setValue){
//   //         setState(() {
//   //           _selectedItem=setValue;
//   //         });
//   //       }
//   //       ),
//   //  );




