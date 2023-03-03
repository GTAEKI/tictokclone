import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/authentication/onboarding/interest_screen.dart';
import 'package:tiktok_clone/authentication/widget/form_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  static DateTime initialDate = DateTime.now();

  final DateTime _maximumDate = DateTime(
    initialDate.year - 12,
    initialDate.month,
    initialDate.day,
  );

  @override
  void initState() {
    super.initState();
    _setTextFieldData(_maximumDate);
  }

  void _setTextFieldData(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void onEmailTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
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
              "When is your birthday?",
              style: TextStyle(
                  fontSize: Sizes.size24, fontWeight: FontWeight.w700),
            ),
            Gaps.v10,
            const Text(
              'Your birthday won\'t be shown publicly.',
              style: TextStyle(fontSize: Sizes.size14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            Gaps.v20,
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                enabled: false,
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
                child: const FormButton(
                  buttonText: "Next",
                  disabled: false,
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldData,
          maximumDate: _maximumDate,
          initialDateTime: _maximumDate,
        ),
      )),
    );
  }
}
