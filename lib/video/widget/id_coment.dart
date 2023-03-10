import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComent extends StatelessWidget {
  final String id, coment;

  const VideoComent({
    super.key,
    required this.id,
    required this.coment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          id,
          style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v10,
        Text(
          coment,
          style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
