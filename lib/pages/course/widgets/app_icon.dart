
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  const AppIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 16,
      ),
    );
  }
}
