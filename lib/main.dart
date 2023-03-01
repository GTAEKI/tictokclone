import 'package:flutter/material.dart';
import 'package:tiktok_clone/authentication/screens/sign_up_screen.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xffe9435a),
      ),
      home: const SignUpScreen(),
    );
  }
}
