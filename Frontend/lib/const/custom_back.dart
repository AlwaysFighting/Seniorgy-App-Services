import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  final String imageURL = "assets/images";

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        '$imageURL/Const/Back.png',
        width: 31,
        height: 31,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}