import 'package:flutter/material.dart';
import 'package:hello_world/screens/home_page.dart';
import 'package:hello_world/screens/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Home Page'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Profile Page'
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
    );
  }
}
