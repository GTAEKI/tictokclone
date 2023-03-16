import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ComentBottomScreen extends StatefulWidget {
  const ComentBottomScreen({super.key});

  @override
  State<ComentBottomScreen> createState() => _ComentBottomScreenState();
}

class _ComentBottomScreenState extends State<ComentBottomScreen> {
  final ScrollController _scrollController = ScrollController();
  final String _profileUrl =
      "https://avatars.githubusercontent.com/u/125863048?v=4";

  bool _isWriting = false;

  void _onPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.73,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text(
            "22796 comments",
            style: TextStyle(fontSize: Sizes.size16),
          ),
          actions: [
            IconButton(
              onPressed: () => _onPressed(context),
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    bottom: Sizes.size96 + Sizes.size20,
                    right: Sizes.size16,
                    left: Sizes.size16,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) => Gaps.v16,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        foregroundImage: NetworkImage(_profileUrl),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GTAEK",
                              style: TextStyle(
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500),
                            ),
                            const Text("Location: Wharariki Beach, New Zealand")
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            color: Colors.black45,
                            size: Sizes.size20,
                          ),
                          Gaps.v3,
                          Text(
                            "52.2K",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                width: size.width,
                bottom: 0,
                child: BottomAppBar(
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: Sizes.size12,
                  //   vertical: Sizes.size10,
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size12,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade500,
                          foregroundImage: NetworkImage(_profileUrl),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              onTap: _onStartWriting,
                              textInputAction: TextInputAction.newline,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    right: Sizes.size10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const FaIcon(
                                        FontAwesomeIcons.at,
                                        color: Colors.black54,
                                      ),
                                      Gaps.h14,
                                      const FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: Colors.black54,
                                      ),
                                      Gaps.h14,
                                      const FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.black54,
                                      ),
                                      if (_isWriting)
                                        Row(
                                          children: [
                                            Gaps.h14,
                                            GestureDetector(
                                              onTap: _stopWriting,
                                              child: FaIcon(
                                                FontAwesomeIcons.arrowRight,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                hintText: "Add comment",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size10),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
