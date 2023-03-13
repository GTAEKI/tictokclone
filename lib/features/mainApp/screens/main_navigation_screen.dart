import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/mainApp/widget/main_navigation_icon.dart';
import 'package:tiktok_clone/features/mainApp/widget/main_video_icon.dart';
import 'package:tiktok_clone/features/video/screens/timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedindex = 0;

  _onTap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  _mainVideoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("video"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedindex == 0 ? Colors.black54 : Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedindex != 0,
          child: const VideoTimelineScreen(),
        ),
        Offstage(
          offstage: _selectedindex != 1,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedindex != 3,
          child: Container(),
        ),
        Offstage(
          offstage: _selectedindex != 4,
          child: Container(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: _selectedindex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24, vertical: Sizes.size12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainNavigationIcon(
                mainIcon: FontAwesomeIcons.house,
                mainLabel: "Home",
                isSelected: _selectedindex == 0,
                onTap: () => _onTap(0),
                selectedindex: _selectedindex,
              ),
              MainNavigationIcon(
                mainIcon: FontAwesomeIcons.magnifyingGlass,
                mainLabel: "Discover",
                isSelected: _selectedindex == 1,
                onTap: () => _onTap(1),
                selectedindex: _selectedindex,
              ),
              Gaps.h10,
              GestureDetector(
                onTap: _mainVideoScreen,
                child: MainVideoIcon(
                  inverted: _selectedindex != 0,
                ),
              ),
              Gaps.h10,
              MainNavigationIcon(
                mainIcon: FontAwesomeIcons.inbox,
                mainLabel: "Inbox",
                isSelected: _selectedindex == 3,
                onTap: () => _onTap(3),
                selectedindex: _selectedindex,
              ),
              MainNavigationIcon(
                mainIcon: FontAwesomeIcons.user,
                mainLabel: "User",
                isSelected: _selectedindex == 4,
                onTap: () => _onTap(4),
                selectedindex: _selectedindex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Material 3 적용
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[_selectedindex],
//       bottomNavigationBar: NavigationBar(
//           backgroundColor: Colors.teal,
//           surfaceTintColor: Colors.amber,
//           selectedIndex: _selectedindex,
//           onDestinationSelected: _onTap,
//           destinations: const [
//             NavigationDestination(
//               icon: FaIcon(
//                 FontAwesomeIcons.house,
//               ),
//               label: "Home",
//             ),
//             NavigationDestination(
//               icon: FaIcon(
//                 FontAwesomeIcons.magnifyingGlass,
//               ),
//               label: "Search",
//             ),
//             NavigationDestination(
//               icon: FaIcon(
//                 FontAwesomeIcons.house,
//               ),
//               label: "Home",
//             ),
//           ]),
//     );
//   }
// }

// 네비게이션 2 적용 
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[_selectedindex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _onTap,
//         currentIndex: _selectedindex,
//         // type: BottomNavigationBarType.shifting,
//         // selectedItemColor: Theme.of(context).primaryColor,
//         fixedColor: Colors.amber,
//         backgroundColor: Colors.black12,
//         elevation: 0,
//         iconSize: Sizes.size28,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: FaIcon(FontAwesomeIcons.house),
//             label: "house",
//             tooltip: "Go home",
//             backgroundColor: Colors.amber,
//           ),
//           BottomNavigationBarItem(
//             icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
//             label: "search",
//           ),
//         ],
//       ),
//     );
//   }