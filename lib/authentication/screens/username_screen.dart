import 'package:flutter/material.dart';
import 'package:tiktok_clone/authentication/screens/email_screen.dart';
import 'package:tiktok_clone/authentication/widget/form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _userNameController = TextEditingController();

  String _userName = "";

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      _userName = _userNameController.text;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  void onEmailTap() {
    if (_userName.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const EmailScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create username",
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700),
            ),
            Gaps.v10,
            const Text(
              'You can always change this later.',
              style: TextStyle(fontSize: Sizes.size14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            Gaps.v20,
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v40,
            GestureDetector(
                onTap: onEmailTap,
                child: FormButton(
                    buttonText: "Next", disabled: _userName.isEmpty)),
          ],
        ),
      ),
    );
  }
}
