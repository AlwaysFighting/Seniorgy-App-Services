import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      width: MediaQuery.of(context).size.width,
      height: 8,
    );
  }
}