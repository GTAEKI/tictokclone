import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class MainVideoIcon extends StatefulWidget {
  const MainVideoIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<MainVideoIcon> createState() => _MainVideoIconState();
}

class _MainVideoIconState extends State<MainVideoIcon> {
  bool _mainVideoIconState = false;

  void _onHover(PointerEvent detail) {
    setState(() {
      _mainVideoIconState = !_mainVideoIconState;
      print("$_mainVideoIconState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _onHover,
      onExit: _onHover,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 15,
            child: AnimatedOpacity(
              opacity: _mainVideoIconState ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(Sizes.size11)),
              ),
            ),
          ),
          Positioned(
            left: 15,
            child: AnimatedOpacity(
              opacity: _mainVideoIconState ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 35,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(Sizes.size11)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 35,
            decoration: BoxDecoration(
              color: _mainVideoIconState
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size14),
            ),
            child: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
    );
  }
}
