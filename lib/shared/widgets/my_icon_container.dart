import 'package:flutter/material.dart';

class MyIconContainer extends StatelessWidget {
  final IconData icon;

  const MyIconContainer({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black
      ),
      child: Icon(
        icon,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
