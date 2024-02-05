import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  //final Color? color;
  final EdgeInsets? margin;
  final double height;

  const Line({
    super.key,
    //this.color,
    this.margin,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: Theme.of(context).dividerColor,
      //color: color ?? Colors.grey[300],
      height: height,
    );
  }
}
