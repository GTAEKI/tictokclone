import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isWriting = false;

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _stopWriting,
          child: ListTile(
            horizontalTitleGap: Sizes.size8,
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              children: [
                const CircleAvatar(
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017",
                  ),
                  child: Text('니꼬'),
                ),
                Positioned(
                  bottom: -2,
                  right: -2,
                  width: 20,
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border:
                          Border.all(color: Colors.white, width: Sizes.size3),
                    ),
                  ),
                ),
              ],
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
                  size: Sizes.size20,
                ),
                Gaps.h24,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                )
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _stopWriting,
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(Sizes.size10),
              itemBuilder: (context, index) {
                final ismine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      ismine ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(Sizes.size10),
                      decoration: BoxDecoration(
                        color: ismine ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: Radius.circular(
                              ismine ? Sizes.size5 : Sizes.size20),
                          bottomRight: Radius.circular(
                              ismine ? Sizes.size20 : Sizes.size3),
                        ),
                      ),
                      child: const Text(
                        "this is a message!",
                        style: TextStyle(
                            color: Colors.white, fontSize: Sizes.size16),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 8,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size10, vertical: Sizes.size10),
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        controller: _controller,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: Sizes.size10, vertical: Sizes.size10),
                          hintText: "Send your message",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.size20),
                              topRight: Radius.circular(Sizes.size20),
                              bottomLeft: Radius.circular(Sizes.size20),
                              bottomRight: Radius.circular(Sizes.size5),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          suffixIconColor: Colors.black,
                          suffixIcon: Align(
                            widthFactor: 1,
                            child: FaIcon(
                              FontAwesomeIcons.faceGrin,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h14,
                    const FaIcon(FontAwesomeIcons.paperPlane),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
