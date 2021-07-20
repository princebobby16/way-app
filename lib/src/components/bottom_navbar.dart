import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WayBottomNavBar extends StatefulWidget {
  const WayBottomNavBar({Key? key}) : super(key: key);

  @override
  _WayBottomNavBarState createState() => _WayBottomNavBarState();
}

class _WayBottomNavBarState extends State<WayBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15, left: 7, right: 7),
        child: PhysicalModel(
          color: Colors.grey,
          shadowColor: Colors.lightBlueAccent,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  // color: Color(0x7573f1e6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withAlpha(100),
                      spreadRadius: 5,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(Icons.account_circle_outlined),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.group_outlined), onPressed: () {}),
                  IconButton(icon: Icon(Icons.public), onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.message_outlined), onPressed: () {})
                ],
              ),
            ),
          ),
        ));
  }
}
