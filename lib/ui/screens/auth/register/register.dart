import 'package:authentication/core/services/firebase_auth.dart';
import 'package:authentication/ui/screens/auth/login/login.dart';
import 'package:authentication/ui/screens/widgets/custom_button.dart';
import 'package:authentication/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const String route = '/register';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            width: double.maxFinite,
            child: Text('Firebase Register'),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                    'Lets sign you up!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sign up to continue',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  // CustomTextField(
                  //   title: 'Name',
                  //   controller: passwordController,
                  //   isPassword: false,
                  //   icon: Icons.person_outline,
                  // ),
                  // SizedBox(height: 10),
                  // CustomTextField(
                  //   title: 'Phone Number',
                  //   controller: passwordController,
                  //   isPassword: false,
                  //   icon: Icons.phone_outlined,
                  // ),
                  // SizedBox(height: 10),
                  CustomTextField(
                    title: 'EMAIL',
                    isPassword: false,
                    controller: emailController,
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
                      final bool response = await AuthRepository().signUpUserwithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                      if (response == true) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.route,
                          (route) => false,
                        );
                        return;
                      } else {
                        return;
                      }
                    },
                    title: 'Sign Up',
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.route,
                      (route) => false,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
