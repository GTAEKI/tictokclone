import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/mainApp/screens/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  _onPanDragging(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      //to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      //to the left
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _enterApp() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      ((route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanDragging,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24, vertical: Sizes.size32),
            child: AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Watch cool videos!",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                        fontSize: Sizes.size20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Follow the rules!",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Take care of one another! Please",
                    style: TextStyle(
                        fontSize: Sizes.size20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: CupertinoButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _enterApp,
                  child: const Text("Enter the App")),
            ),
          ),
        ),
      ),
    );
  }
}


/* 첫번째 방법 */
// class TutorialScreen extends StatelessWidget {
//   const TutorialScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: SafeArea(
//           child: TabBarView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: Sizes.size24, vertical: Sizes.size32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Watch cool videos!",
//                       style: TextStyle(
//                           fontSize: Sizes.size36, fontWeight: FontWeight.bold),
//                     ),
//                     Gaps.v16,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                           fontSize: Sizes.size20, fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: Sizes.size24, vertical: Sizes.size32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Follow the rules!",
//                       style: TextStyle(
//                           fontSize: Sizes.size36, fontWeight: FontWeight.bold),
//                     ),
//                     Gaps.v16,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                           fontSize: Sizes.size20, fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: Sizes.size24, vertical: Sizes.size32),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Enjoy the ride.",
//                       style: TextStyle(
//                           fontSize: Sizes.size36, fontWeight: FontWeight.bold),
//                     ),
//                     Gaps.v16,
//                     Text(
//                       "Videos are personalized for you based on what you watch, like, and share.",
//                       style: TextStyle(
//                           fontSize: Sizes.size20, fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               vertical: 40,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 TabPageSelector(
//                   selectedColor: Colors.black38,
//                   indicatorSize: Sizes.size10,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
