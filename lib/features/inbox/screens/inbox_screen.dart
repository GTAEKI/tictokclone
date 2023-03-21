import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/screens/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/screens/chats_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onTapActivity(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ActivityScreen(),
      ),
    );
  }

  void _onTapPaperPlane(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ChatsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          "Inbox",
          style: TextStyle(fontSize: Sizes.size16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => _onTapPaperPlane(context),
            icon: const FaIcon(FontAwesomeIcons.paperPlane),
            iconSize: Sizes.size20,
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onTapActivity(context),
            title: const Text(
              "Activity",
              style: TextStyle(
                  fontSize: Sizes.size16, fontWeight: FontWeight.w600),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(
            color: Colors.black12,
            height: 1,
          ),
          ListTile(
            leading: Container(
              width: Sizes.size52,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text(
              "New followers",
              style: TextStyle(
                  fontSize: Sizes.size16, fontWeight: FontWeight.w600),
            ),
            subtitle: const Text(
              "Messages from followers will appear here",
              style: TextStyle(fontSize: Sizes.size12),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
