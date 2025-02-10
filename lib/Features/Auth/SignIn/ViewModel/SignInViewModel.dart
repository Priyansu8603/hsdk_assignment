import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hsdk_assignment/Features/Auth/SignIn/Repository/AuthRepository.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository;
  User? _user;
  bool _isLoading = false;

  AuthViewModel(this._authRepository);

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loginWithGoogle(BuildContext context) async {
    bool isConnected = await _checkInternetConnectivity();

    if (!isConnected) {
      _showNoInternetDialog(context);
      return;
    }

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

  // Method to check internet connectivity
  Future<bool> _checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Show No Internet Dialog
  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'No Internet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('Core/Assets/Images/404.png', height: 150,width: 150,),
            const SizedBox(height: 10),
            const Text(
              'Please check your internet connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
