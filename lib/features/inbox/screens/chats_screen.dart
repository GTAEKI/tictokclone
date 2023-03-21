import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/screens/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // [Set 1_영상보기전]
  // final List<Map<String, dynamic>> _dmList = [
  //   {
  //     "image":
  //         Image.network("https://avatars.githubusercontent.com/u/31253215?v=4"),
  //     "title": "Rody Davis",
  //     "subTitle": "Say hi to Rody Davis",
  //     "lastTime": "\n2:16 PM"
  //   },
  //   {
  //     "image": FaIcon(
  //       FontAwesomeIcons.solidUser,
  //       color: Colors.grey.shade400,
  //       size: Sizes.size36,
  //     ),
  //     "title": "Johnmobbin",
  //     "subTitle": "😭😭😭",
  //     "lastTime": "\n1:37 PM"
  //   },
  // ];

  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: const Duration(milliseconds: 500),
      );
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => FadeTransition(
            opacity: animation,
            child: SizeTransition(
                sizeFactor: animation,
                child: Container(color: Colors.red, child: _makeTile(index)))),
      );
      _items.removeAt(index);
    }
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: () => _onTapItem(),
      leading: const CircleAvatar(
        radius: 30,
        foregroundImage: NetworkImage(
          "https://avatars.githubusercontent.com/u/3612017",
        ),
        child: Text('니꼬'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Lynn ($index)",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            "2:16 PM",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text("Don't forget to make video"),
    );
  }

  void _onTapItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ChatDetailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(FontAwesomeIcons.plus),
          ),
        ],
      ),
      body: AnimatedList(
        key: _key,
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
      ),

      // [Set 1 _ 영상보기전]
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
      //   children: [
      //     for (var dmList in _dmList)
      //       ListTile(
      //         leading: Container(
      //           clipBehavior: Clip.hardEdge,
      //           width: Sizes.size52,
      //           height: Sizes.size52,
      //           decoration: const BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: Colors.black,
      //           ),
      //           child: Container(
      //               alignment: Alignment.bottomCenter, child: dmList["image"]),
      //         ),
      //  title: Row(
      //   mainAxisAlignment: MainAxisAlignmspaceBetween,
      //   crossAxisAlignment: CrossAxisAlignmstart,
      //    children: [
      //      Text(dmList["title"]),
      //      Text(
      //     dmList["lastTime"],
      //     style: const TextStyle(
      //         color: Colors.black38, fontSiSizes.size12),
      //    ],
      //  ),
      //         subtitle: Text(dmList["subTitle"]),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
