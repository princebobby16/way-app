import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class WayBottomNavBar extends StatefulWidget {
  const WayBottomNavBar({Key? key}) : super(key: key);

  @override
  _WayBottomNavBarState createState() => _WayBottomNavBarState();
}

class _WayBottomNavBarState extends State<WayBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var _index = 0;

    return FloatingNavbar(
      backgroundColor: Colors.white,
      borderRadius: 40.0,
      elevation: 10,
      onTap: (int val) => setState(() => _index = val),
      currentIndex: _index,
      unselectedItemColor: Colors.black,
      selectedBackgroundColor: null,
      items: [
        FloatingNavbarItem(icon: Icons.account_circle_outlined),
        FloatingNavbarItem(icon: Icons.group_outlined),
        FloatingNavbarItem(icon: Icons.public),
        FloatingNavbarItem(icon: Icons.favorite_border_outlined),
        FloatingNavbarItem(icon: Icons.message_outlined),
      ],
    );
  }
}
