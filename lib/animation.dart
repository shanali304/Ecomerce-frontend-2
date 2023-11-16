// // import 'dart:async';

// // import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// // import 'package:auto_size_text/auto_size_text.dart';
// // import 'package:circular_reveal_animation/circular_reveal_animation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/rendering.dart';
// // import 'package:flutter/services.dart';



// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         scaffoldBackgroundColor: Colors.white,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
// //   final autoSizeGroup = AutoSizeGroup();
// //   var _bottomNavIndex = 0; //default index of a first screen

// //   late AnimationController _fabAnimationController;
// //   late AnimationController _borderRadiusAnimationController;
// //   late Animation<double> fabAnimation;
// //   late Animation<double> borderRadiusAnimation;
// //   late CurvedAnimation fabCurve;
// //   late CurvedAnimation borderRadiusCurve;
// //   late AnimationController _hideBottomBarAnimationController;

// //   final iconList = <IconData>[
// //     Icons.brightness_5,
// //     Icons.brightness_4,
// //     Icons.brightness_6,
// //     Icons.brightness_7,
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     final systemTheme = SystemUiOverlayStyle.light.copyWith(
// //       systemNavigationBarColor: HexColor('#373A36'),
// //       systemNavigationBarIconBrightness: Brightness.light,
// //     );
// //     SystemChrome.setSystemUIOverlayStyle(systemTheme);

// //     _fabAnimationController = AnimationController(
// //       duration: Duration(milliseconds: 500),
// //       vsync: this,
// //     );
// //     _borderRadiusAnimationController = AnimationController(
// //       duration: Duration(milliseconds: 500),
// //       vsync: this,
// //     );
// //     fabCurve = CurvedAnimation(
// //       parent: _fabAnimationController,
// //       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
// //     );
// //     borderRadiusCurve = CurvedAnimation(
// //       parent: _borderRadiusAnimationController,
// //       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
// //     );

// //     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
// //     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
// //       borderRadiusCurve,
// //     );

// //     _hideBottomBarAnimationController = AnimationController(
// //       duration: Duration(milliseconds: 200),
// //       vsync: this,
// //     );

// //     Future.delayed(
// //       Duration(seconds: 1),
// //       () => _fabAnimationController.forward(),
// //     );
// //     Future.delayed(
// //       Duration(seconds: 1),
// //       () => _borderRadiusAnimationController.forward(),
// //     );
// //   }

// //   bool onScrollNotification(ScrollNotification notification) {
// //     if (notification is UserScrollNotification &&
// //         notification.metrics.axis == Axis.vertical) {
// //       switch (notification.direction) {
// //         case ScrollDirection.forward:
// //           _hideBottomBarAnimationController.reverse();
// //           _fabAnimationController.forward(from: 0);
// //           break;
// //         case ScrollDirection.reverse:
// //           _hideBottomBarAnimationController.forward();
// //           _fabAnimationController.reverse(from: 1);
// //           break;
// //         case ScrollDirection.idle:
// //           break;
// //       }
// //     }
// //     return false;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Theme(
// //       data: ThemeData.dark(),
// //       child: Scaffold(
// //         extendBody: true,
// //         appBar: AppBar(
// //           title: Text(
// //             widget.title,
// //             style: TextStyle(color: Colors.white),
// //           ),
// //           backgroundColor: HexColor('#373A36'),
// //         ),
// //         body: NotificationListener<ScrollNotification>(
// //           onNotification: onScrollNotification,
// //           child: NavigationScreen(iconList[_bottomNavIndex]),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           backgroundColor: HexColor('#FFA400'),
// //           child: Icon(
// //             Icons.brightness_3,
// //             color: HexColor('#373A36'),
// //           ),
// //           onPressed: () {
// //             _fabAnimationController.reset();
// //             _borderRadiusAnimationController.reset();
// //             _borderRadiusAnimationController.forward();
// //             _fabAnimationController.forward();
// //           },
// //         ),
// //         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //         bottomNavigationBar: AnimatedBottomNavigationBar.builder(
// //           itemCount: iconList.length,
// //           tabBuilder: (int index, bool isActive) {
// //             final color = isActive ? HexColor('#FFA400') : Colors.white;
// //             return Column(
// //               mainAxisSize: MainAxisSize.min,
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(
// //                   iconList[index],
// //                   size: 24,
// //                   color: color,
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 8),
// //                   child: AutoSizeText(
// //                     "brightness $index",
// //                     maxLines: 1,
// //                     style: TextStyle(color: color),
// //                     group: autoSizeGroup,
// //                   ),
// //                 )
// //               ],
// //             );
// //           },
// //           backgroundColor: HexColor('#373A36'),
// //           activeIndex: _bottomNavIndex,
// //           splashColor: HexColor('#FFA400'),
// //           notchAndCornersAnimation: borderRadiusAnimation,
// //           splashSpeedInMilliseconds: 300,
// //           notchSmoothness: NotchSmoothness.defaultEdge,
// //           gapLocation: GapLocation.center,
// //           leftCornerRadius: 32,
// //           rightCornerRadius: 32,
// //           onTap: (index) => setState(() => _bottomNavIndex = index),
// //           hideAnimationController: _hideBottomBarAnimationController,
// //           shadow: BoxShadow(
// //             offset: Offset(0, 1),
// //             blurRadius: 12,
// //             spreadRadius: 0.5,
// //             color: HexColor('#FFA400'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class NavigationScreen extends StatefulWidget {
// //   final IconData iconData;

// //   NavigationScreen(this.iconData) : super();

// //   @override
// //   _NavigationScreenState createState() => _NavigationScreenState();
// // }

// // class _NavigationScreenState extends State<NavigationScreen>
// //     with TickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> animation;

// //   @override
// //   void didUpdateWidget(NavigationScreen oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (oldWidget.iconData != widget.iconData) {
// //       _startAnimation();
// //     }
// //   }

// //   @override
// //   void initState() {
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 1000),
// //     );
// //     animation = CurvedAnimation(
// //       parent: _controller,
// //       curve: Curves.easeIn,
// //     );
// //     _controller.forward();
// //     super.initState();
// //   }

// //   _startAnimation() {
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 1000),
// //     );
// //     animation = CurvedAnimation(
// //       parent: _controller,
// //       curve: Curves.easeIn,
// //     );
// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.white,
// //       child: ListView(
// //         children: [
// //           SizedBox(height: 64),
// //           Center(
// //             child: CircularRevealAnimation(
// //               animation: animation,
// //               centerOffset: Offset(80, 80),
// //               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
// //               child: Icon(
// //                 widget.iconData,
// //                 color: HexColor('#FFA400'),
// //                 size: 160,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class HexColor extends Color {
// //   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

// //   static int _getColorFromHex(String hexColor) {
// //     hexColor = hexColor.toUpperCase().replaceAll('#', '');
// //     if (hexColor.length == 6) {
// //       hexColor = 'FF' + hexColor;
// //     }
// //     return int.parse(hexColor, radix: 16);
// //   }
// // }

// import 'package:circular_bottom_navigation/tab_item.dart';
// import 'package:flutter/material.dart';
// import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

// import 'samplepages.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Circular Bottom Navigation Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Directionality(
//         // use this property to change direction in whole app
//         // CircularBottomNavigation will act accordingly
//         textDirection: TextDirection.ltr,
//         child: MyHomePage(title: 'circular_bottom_navigation'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({
//     Key? key,
//     this.title,
//   }) : super(key: key);
//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int selectedPos = 0;

//   double bottomNavBarHeight = 60;

//   List<TabItem> tabItems = List.of([
//     TabItem(
//       Icons.home,
//       "Home",
//       Color.fromARGB(255, 60, 99, 137),
//       labelStyle: TextStyle(
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//     TabItem(
//       Icons.search,
//       "Search",
//       Colors.orange,
//       labelStyle: TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     TabItem(
//       Icons.layers,
//       "Reports",
//       Colors.red,
//       circleStrokeColor: Colors.black,
//     ),
//     TabItem(
//       Icons.notifications,
//       "Notifications",
//       Colors.cyan,
//     ),
//   ]);

//   late CircularBottomNavigationController _navigationController;

//   @override
//   void initState() {
//     super.initState();
//     _navigationController = CircularBottomNavigationController(selectedPos);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Padding(
//             child: bodyContainer(),
//             padding: EdgeInsets.only(bottom: bottomNavBarHeight),
//           ),
//           Align(alignment: Alignment.bottomCenter, child: bottomNav())
//         ],
//       ),
//     );
//   }
// // HomePage(),AboutPage(),ServicesPage()
//   Widget bodyContainer() {
//     Color? selectedColor = tabItems[selectedPos].circleColor;
//     // String slogan;
//     switch (selectedPos) {
//       case 0:
//       HomePage();
//         // slogan = "Family, Happiness, Food";
//         break;
//       case 1:
//         // slogan = "Find, Check, Use";
//         break;
//       case 2:
//         // slogan = "Receive, Review, Rip";
//         break;
//       case 3:
//         // slogan = "Noise, Panic, Ignore";
//         break;
//       default:
//         // slogan = "";
//         break;
//     }

//     return GestureDetector(
 
//       onTap: () {
//         if (_navigationController.value == tabItems.length - 1) {
//           _navigationController.value = 0;
//         } else {
//           _navigationController.value = _navigationController.value! + 1;
//         }
//       },
//     );
//   }

//   Widget bottomNav() {
//     return CircularBottomNavigation(
//       tabItems,
//       controller: _navigationController,
//       selectedPos: selectedPos,
//       barHeight: bottomNavBarHeight,
//       // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
//       barBackgroundColor: Colors.white,
    
//       backgroundBoxShadow: <BoxShadow>[
//         BoxShadow(color: Colors.black45, blurRadius: 10.0),
//       ],
//       animationDuration: Duration(milliseconds: 300),
//       selectedCallback: (int? selectedPos) {
//         setState(() {
//           this.selectedPos = selectedPos ?? 0;
//           print(_navigationController.value);
//         });
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _navigationController.dispose();
//   }
// }