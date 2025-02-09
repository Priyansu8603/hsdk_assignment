import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hsdk_assignment/Features/Auth/SignIn/Repository/AuthRepository.dart';


class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository;
  User? _user;
  bool _isLoading = false;

  AuthViewModel(this._authRepository);

  User? get user => _user;
  bool get isLoading => _isLoading;

  // Method to login with Google
  Future<void> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    _user = await _authRepository.signInWithGoogle();

    _isLoading = false;
    notifyListeners();
  }

  // Method to sign out
  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }

  // Get current user
  User? getCurrentUser() {
    return _authRepository.getCurrentUser();
  }
}
