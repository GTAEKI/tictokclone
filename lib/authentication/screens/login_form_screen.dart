import 'package:flutter/material.dart';
import 'package:tiktok_clone/authentication/widget/form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size32),
        child: Form(
          child: Column(
            children: [
              TextFormField(),
              Gaps.v16,
              TextFormField(),
              Gaps.v28,
              const FormButton(buttonText: "Log in", disabled: false),
            ],
          ),
        ),
      ),
    );
  }
}
