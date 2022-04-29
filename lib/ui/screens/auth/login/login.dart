import 'dart:developer';

import 'package:authentication/core/services/firebase_auth.dart';
import 'package:authentication/ui/screens/auth/register/register.dart';
import 'package:authentication/ui/screens/home/home.dart';
import 'package:authentication/ui/screens/widgets/custom_button.dart';
import 'package:authentication/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String route = '/login';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              width: double.maxFinite,
              child: Text('Firebase Auth'),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: 4,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    title: 'EMAIL',
                    controller: emailController,
                    isPassword: false,
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    title: 'PASSWORD',
                    controller: passwordController,
                    isPassword: true,
                    icon: Icons.lock_outline_sharp,
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    callback: () async {
                      final bool response = await AuthRepository().signInWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                      if (response == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeScreen.route,
                          (route) => false,
                        );
                        return;
                      } else {
                        return;
                      }
                    },
                    title: 'Log In',
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      RegisterScreen.route,
                      (route) => false,
                    ),
                    child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.7, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final bool response = await AuthRepository().signInWithGoogle();
                          if (response) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.route,
                              (route) => false,
                            );
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Image.asset(
                          'assets/png/google.png',
                          height: 40,
                        ),
                      ),
                      SizedBox(width: 40),
                      GestureDetector(
                        onTap: () async {
                          final bool response = await AuthRepository().signInWithFacebook();
                          if (response) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeScreen.route,
                              (route) => false,
                            );
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Image.asset(
                          'assets/png/facebook.png',
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
