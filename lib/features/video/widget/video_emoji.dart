import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoEmoji extends StatelessWidget {
  final String count;
  final IconData icon;

  const VideoEmoji({
    super.key,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(
          icon,
          size: Sizes.size32,
          color: Colors.white,
        ),
        Gaps.v6,
        Text(
          count,
          style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size12,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
