import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
import 'screens/match_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/feed_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _UmeeAppState createState() => _UmeeAppState();
}

class _UmeeAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ProfileScreen(),
    MatchScreen(),
    ChatScreen(),
    FeedScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Umee Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: const Color(0x2A2A2A),
      ),
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0x2A2A2A),
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Match',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Feed',
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
