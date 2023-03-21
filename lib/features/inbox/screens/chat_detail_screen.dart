import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        titleSpacing: 0,
        title: ListTile(
          leading: const CircleAvatar(
            radius: 30,
            foregroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/3612017",
            ),
            child: Text('니꼬'),
          ),
          title: const Text(
            "Lynn",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text("Active now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
              ),
              Gaps.h24,
              FaIcon(FontAwesomeIcons.circleDot, color: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
