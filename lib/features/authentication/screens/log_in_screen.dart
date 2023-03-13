import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/screens/login_form_screen.dart';
import 'package:tiktok_clone/features/authentication/screens/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/screens/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widget/auth_botton.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
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
                "Log in to TikTok",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v14,
              Text(
                'Manage your account, check notifications, comment on videos, and more.',
                style: TextStyle(fontSize: Sizes.size14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              Gaps.v16,
              AuthButton(
                  screen: LoginFormScreen(),
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
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.h6,
                GestureDetector(
                  onTap: () => onSignUpTap(context),
                  child: Text(
                    'Sign up',
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
