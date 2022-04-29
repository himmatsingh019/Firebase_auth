import 'package:authentication/controllers/toggle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    required this.controller,
    required this.title,
    required this.icon,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showPassword = ref.watch(passwordToggleController);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: (isPassword == true && showPassword == true) ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black,
            size: 18,
          ),
          labelText: title,
          floatingLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
          suffixIcon: isPassword
              ? GestureDetector(
                  onTap: () {
                    ref.read(passwordToggleController.state).state = !showPassword;
                  },
                  child: Icon(
                    showPassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : null,
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
        ),
      ),
    );
  }
}
