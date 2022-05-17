import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordToggleController = StateProvider<bool>((ref) => true);

class AuthLoadingController extends StateNotifier<bool> {
  static final provider = StateNotifierProvider<AuthLoadingController, bool>((ref) => AuthLoadingController());

  AuthLoadingController() : super(false);

  toggleLoading(bool isLoading) {
    state = isLoading;
  }
}
