import 'package:flutter/cupertino.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({
    Key? key,
    required this.function,
    required this.image,
  }) : super(key: key);

  final VoidCallback function;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Image.asset(
        'assets/png/$image.png',
        height: 30,
      ),
    );
  }
}
