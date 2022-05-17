import 'package:authentication/controllers/toggle_controller.dart';
import 'package:authentication/core/services/firebase_auth.dart';
import 'package:authentication/main.dart';
import 'package:authentication/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier {
  static final provider = StateNotifierProvider((ref) => AuthController((ref.read)));
  AuthController(this.read) : super(null);
  final Reader read;

  Future<void> signInViaEmailAndPassword(String email, String password) async {
    read(AuthLoadingController.provider.notifier).toggleLoading(true);
    Future<bool> response = read(AuthRepository.provider).signInWithEmailAndPassword(
      email,
      password,
    );

    read(AuthLoadingController.provider.notifier).toggleLoading(false);

    if (response == false) {
      return;
    } else {
      navigationKey.currentState?.pushNamedAndRemoveUntil(
        HomeScreen.route,
        (route) => false,
      );
      return;
    }
  }
}
