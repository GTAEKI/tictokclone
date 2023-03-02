import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/authentication/screens/birthday_screen.dart';
import 'package:tiktok_clone/authentication/widget/form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _toggleObs = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const BirthdayScreen(),
    ));
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureTap() {
    _toggleObs = !_toggleObs;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                "Password",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              TextField(
                onEditingComplete: _onSubmit,
                autocorrect: false,
                controller: _passwordController,
                obscureText: _toggleObs,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade600,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: _toggleObscureTap,
                        child: FaIcon(
                          _toggleObs
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade600,
                          size: Sizes.size20,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
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
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    _isPasswordValid()
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleXmark,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.red,
                  ),
                  Gaps.h10,
                  const Text(
                    "8 to 20 characters",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  )
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    _isPasswordValid()
                        ? FontAwesomeIcons.circleCheck
                        : FontAwesomeIcons.circleXmark,
                    size: Sizes.size20,
                    color: _isPasswordValid() ? Colors.green : Colors.red,
                  ),
                  Gaps.h10,
                  const Text(
                    "Letters, numbers, and special characters",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isPasswordValid(), //중요포인트
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
