import 'package:authentication/core/services/firebase_auth.dart';
import 'package:authentication/core/services/firebase_database.dart';
import 'package:authentication/ui/screens/auth/login/login.dart';
import 'package:authentication/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String route = '/home';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              title: 'Name',
              controller: nameController,
              isPassword: false,
              icon: Icons.person_outline,
            ),
            SizedBox(height: 20),
            CustomTextField(
              title: 'Phone Number',
              controller: phoneController,
              isPassword: false,
              icon: Icons.phone_outlined,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final bool response = await FirebaseDatabase().addUser(
                  nameController.text,
                  phoneController.text,
                );
                if (response) {
                  nameController.clear();
                  phoneController.clear();
                  return;
                } else {
                  return;
                }
              },
              child: Container(
                height: 42,
                width: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Add User'),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final bool response = await AuthRepository().signOutUser();

                if (response) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.route,
                    (route) => false,
                  );
                  return;
                } else {
                  return;
                }
              },
              child: Container(
                height: 42,
                width: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
