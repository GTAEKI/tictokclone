import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthBotton extends StatelessWidget {
  final String authtext;
  final FaIcon icon;
  final screen;

  const AuthBotton({
    super.key,
    required this.authtext,
    required this.icon,
    required this.screen,
  });

  void onAuthBotton(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAuthBotton(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: icon),
              Expanded(
                child: Text(
                  authtext,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
