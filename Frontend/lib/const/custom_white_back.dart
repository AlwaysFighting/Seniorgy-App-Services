import 'package:flutter/material.dart';

class CustomBackWButton extends StatelessWidget {
  const CustomBackWButton({
    super.key,
  });

  final String imageURL = "assets/images";

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        '$imageURL/Const/Back_White.png',
        width: 31,
        height: 31,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}