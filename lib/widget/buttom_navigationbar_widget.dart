import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  BottomNavigationBarWidget(
      {required this.onTabSelected, required this.currentIndex});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Profile',
        ),
      ],
    );
  }
}
