import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Auth/SignIn/View/SignIn.dart';
import '../../Auth/SignIn/ViewModel/SignInViewModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  late StreamSubscription<ConnectivityResult> _subscription;
  bool _isDialogOpen = false; // Prevent multiple dialogs

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  @override
  void dispose() {
    _subscription.cancel(); // Cancel the stream when widget is disposed
    super.dispose();
  }

  void checkInternetConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _showNoInternetDialog();
      } else {
        if (_isDialogOpen) {
          Navigator.pop(context); // Close dialog when internet is back
          _isDialogOpen = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Poppins',
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${authViewModel.user?.displayName ?? "User"}',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authViewModel.signOut(); // Sign out user
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showNoInternetDialog() {
    if (!_isDialogOpen) {
      _isDialogOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text(
            'No Internet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('Core/Assets/Images/404.png', height: 200,width: 200,), // Add an image in assets
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
      ).then((_) => _isDialogOpen = false);
    }
  }


}
