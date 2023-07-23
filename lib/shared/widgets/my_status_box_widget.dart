import 'package:flutter/material.dart';

class MyStatusBoxWidget extends StatelessWidget {
  final IconData icon;
  final String stats;
  final String title;
  final Color color;
  final String? description;
  final String? statsUnit;
  final String? statsCurrency;

  const MyStatusBoxWidget({
    Key? key,
    required this.icon,
    required this.stats,
    required this.title,
    required this.color,
    this.description = "",
    this.statsUnit = "",
    this.statsCurrency = ""
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
                icon,
              size: 40,
            ),
            SizedBox(height: 20),
            Text(
              _getTitle(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23
              ),
            ),
            if(description!.isNotEmpty)
              SizedBox(height: 20),
            if(description!.isNotEmpty)
              Text(
                description!,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400
                ),
              )
          ],
        ),
      ),
    );
  }

  /// To get title to show in our widget
  String _getTitle(){
    if(statsCurrency!.isNotEmpty && statsUnit!.isNotEmpty){
      return "$statsCurrency$stats${statsUnit!}";
    } else if(statsUnit!.isNotEmpty){
      return "$stats${statsUnit!}";
    } else {
      return stats;
    }
  }
}
