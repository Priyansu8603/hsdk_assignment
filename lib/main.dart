import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hsdk_assignment/Features/Auth/SignIn/View/SignIn.dart';
import 'package:provider/provider.dart';

import 'Features/Auth/SignIn/Repository/AuthRepository.dart';
import 'Features/Auth/SignIn/ViewModel/SignInViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authRepository = AuthRepository(); // Initialize only once

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>(create: (_) => authRepository),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(authRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}
