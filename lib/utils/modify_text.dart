import 'package:flutter/cupertino.dart';

class ModifyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const ModifyText(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: size),
    );
  }
}
