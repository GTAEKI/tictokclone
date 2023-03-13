import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/onboarding/screens/interest_screen.dart';
import 'package:tiktok_clone/features/authentication/widget/form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _form = {};

  void _onSummitTap() {
    //validate이용하는 첫번째 옵션
    // if (_formKey.currentState != null) {
    //   _formKey.currentState!.validate();
    // }
    // validate 이용하는 두번째 옵션
    // currentState?
    //(의미 = currentState 값이 있으면 오른쪽 실행 없으면 안함)
    // _formKey.currentState?.validate();

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          ((route) => false),
        );
      }
    }
  }

  void _onTapScaffold() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapScaffold,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    }
                    return "Check your email address";
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _form["email"] = newValue;
                    }
                  },
                ),
                Gaps.v16,
                TextFormField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return "Wrong Password";
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        _form["Password"] = newValue;
                      }
                    }),
                Gaps.v28,
                GestureDetector(
                    onTap: _onSummitTap,
                    child: const FormButton(
                        buttonText: "Log in", disabled: false)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
