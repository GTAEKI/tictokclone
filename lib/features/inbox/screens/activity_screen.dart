import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

final List<Map<String, dynamic>> _tabs = [
  {
    "title": "All activity",
    "icon": FontAwesomeIcons.solidMessage,
  },
  {
    "title": "Likes",
    "icon": FontAwesomeIcons.solidHeart,
  },
  {
    "title": "Comments",
    "icon": FontAwesomeIcons.solidComments,
  },
  {
    "title": "Mentions",
    "icon": FontAwesomeIcons.at,
  },
  {
    "title": "Followers",
    "icon": FontAwesomeIcons.solidUser,
  },
  {
    "title": "From TikTok",
    "icon": FontAwesomeIcons.tiktok,
  }
];

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications = List.generate(20, (index) => "${index}h");

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final Animation<Color?> _onbarrior =
      ColorTween(begin: Colors.transparent, end: Colors.black38)
          .animate(_animationController);

  bool _showBarrior = false;

  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  late final Animation<Offset> _position =
      Tween(begin: const Offset(0.0, -1), end: Offset.zero)
          .animate(_animationController);

  void _onAllActivity() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _showBarrior = !_showBarrior;
    });
  }

  void _onDismissed(String notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: _onAllActivity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "All activity",
              ),
              RotationTransition(
                turns: _animation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                child: Text(
                  "New",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Gaps.v10,
              for (var notification in _notifications)
                Dismissible(
                  onDismissed: (direction) => _onDismissed(notification),
                  key: Key(notification),
                  background: Container(
                    padding: const EdgeInsets.all(Sizes.size16),
                    alignment: Alignment.centerLeft,
                    color: Colors.green,
                    child: const FaIcon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    padding: const EdgeInsets.all(Sizes.size16),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const FaIcon(
                      FontAwesomeIcons.trashCan,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    minVerticalPadding: Sizes.size14,
                    leading: Container(
                      width: Sizes.size52,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300)),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.bell,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: "Account updates:",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        children: [
                          const TextSpan(
                            text: " Upload longer videos",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: " $notification",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    trailing: const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size14,
                      color: Colors.black54,
                    ),
                  ),
                )
            ],
          ),
          if (_showBarrior)
            AnimatedModalBarrier(
              color: _onbarrior,
              dismissible: true,
              onDismiss: _onAllActivity,
            ),
          SlideTransition(
            position: _position,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            tab["icon"],
                            color: Colors.black,
                            size: Sizes.size14,
                          ),
                          Gaps.h10,
                          Text(
                            tab["title"],
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size14),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
