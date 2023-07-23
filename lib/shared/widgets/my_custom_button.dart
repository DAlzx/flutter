import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final double paddingWidth;
  final String title;
  final bool hasBackground;

  const MyCustomButton({
    Key? key,
    required this.paddingWidth,
    required this.title,
    required this.hasBackground
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 2
        ),
        color: hasBackground ? Colors.black : Colors.transparent
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: paddingWidth),
        child: Text(
          title,
          style: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 25,
           color: hasBackground ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}
