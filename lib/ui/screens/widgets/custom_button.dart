import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.callback,
    required this.title,
    Key? key,
  }) : super(key: key);

  final VoidCallback callback;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Color(0xFFFAB800),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
