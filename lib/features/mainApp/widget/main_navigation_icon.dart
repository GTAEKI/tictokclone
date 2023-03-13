import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class MainNavigationIcon extends StatelessWidget {
  final String mainLabel;
  final IconData mainIcon;
  final bool isSelected;
  final Function onTap;
  final int selectedindex;

  const MainNavigationIcon({
    super.key,
    required this.mainIcon,
    required this.mainLabel,
    required this.isSelected,
    required this.onTap,
    required this.selectedindex,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectedindex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  mainIcon,
                  color: selectedindex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  mainLabel,
                  style: TextStyle(
                      color: selectedindex == 0 ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
