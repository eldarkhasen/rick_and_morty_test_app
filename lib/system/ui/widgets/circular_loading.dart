import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final double? value;
  final Color color;

  const CircularLoading({Key? key, required this.value, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(value: value, strokeWidth: 1.5, valueColor: AlwaysStoppedAnimation<Color>(color));
  }
}
