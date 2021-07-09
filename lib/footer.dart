
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(106, 205, 185, 255),
                  Color.fromARGB(106, 83, 47, 255),
                  Color.fromARGB(106, 196, 170, 255)
                ])),
        // color: Color.fromARGB(213, 152, 108, 246),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }),
              IconButton(
                  icon: Icon(Icons.nightlight_round),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.audiotrack_sharp),
                  color: Colors.white,
                  onPressed: () {
                    // Navigator.of(context).push(createRoute());
                  }),
              IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: () {}),
            ],
          ),
        ),
      );
  }
}