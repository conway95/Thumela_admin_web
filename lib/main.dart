import 'package:admin_web/authentication/login_screen.dart';
import 'package:admin_web/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async
{
  await Firebase.initializeApp(
    options: const FirebaseOptions(apiKey: "AIzaSyCAc-kEqQ-lj0YkSR8JvM6aQdjAm97yP6c",
        appId: "1:664543025337:web:4c06a92428192e97f9e368",
        messagingSenderId: "664543025337", projectId: "thumela-version-2")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Web Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() : const HomeScreen(),
    );
  }
}


