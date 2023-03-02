import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/authentication/screens/log_in_screen.dart';
import 'package:tiktok_clone/authentication/screens/username_screen.dart';
import 'package:tiktok_clone/authentication/widget/auth_botton.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLogInTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size36),
          child: Column(
            children: const [
              Text(
                "Sign up for TikTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              Text(
                'Create a profile, follow other accounts, make your own videos, and more.',
                style: TextStyle(fontSize: Sizes.size14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              Gaps.v16,
              AuthButton(
                  screen: UserNameScreen(),
                  icon: FaIcon(FontAwesomeIcons.user),
                  authtext: 'Use phone or email'),
              Gaps.v16,
              AuthButton(
                  screen: UserNameScreen(),
                  icon: FaIcon(FontAwesomeIcons.apple),
                  authtext: 'Continue with Apple'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade200,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.h6,
                GestureDetector(
                  onTap: () => onLogInTap(context),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
