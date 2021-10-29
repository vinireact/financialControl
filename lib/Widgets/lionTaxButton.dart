import 'package:flutter/material.dart';

class LionTaxButton extends StatelessWidget {
  final String? txt;
  final Function()? fn;
  final Color? color;
  const LionTaxButton({this.txt, this.fn, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: color!),
      ),
      child: TextButton(
        onPressed: fn!,
        child: Text(
          txt!,
          style: TextStyle(color: color!),
        ),
      ),
    );
  }
}
