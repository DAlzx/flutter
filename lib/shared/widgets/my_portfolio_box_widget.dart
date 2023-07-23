import 'package:flutter/material.dart';

class MyPortfolioBoxWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const MyPortfolioBoxWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width * 0.42,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30
              ),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.arrow_right_alt,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
