import 'package:flutter/material.dart';

import '../../constants.dart';
import '../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: buttonColor,
        unselectedItemColor: textColor,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_rounded, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, size: 30),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}
