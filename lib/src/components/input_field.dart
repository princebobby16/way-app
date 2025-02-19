
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WayInput extends StatefulWidget {
  const WayInput({Key? key,
    required this.placeholder,
    this.icon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.hideText = false,
    this.textEditingController,
  }) : super(key: key);

  final String placeholder;
  final bool enabled;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool hideText;
  final TextEditingController? textEditingController;

  @override
  _WayInputState createState() => _WayInputState();
}

class _WayInputState extends State<WayInput> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInSine,
      alignment: Alignment.centerLeft,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withAlpha(100),
              spreadRadius: 5,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: TextField(
        enabled: widget.enabled,
        controller: widget.textEditingController,
        keyboardType: widget.keyboardType,
        obscureText: widget.hideText,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(widget.icon, color: Colors.white,),
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: Colors.white70)
        ),
      ),
    );
  }
}