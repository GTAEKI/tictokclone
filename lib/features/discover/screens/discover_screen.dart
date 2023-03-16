import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

List<String> tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "Live",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _xmarkClick() {
    _searchController.clear();
    _stopWriting();
  }

  _changeTab(int index) {
    _stopWriting();
  }

  _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  _backHomeScreen() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const VideoTimelineScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: _stopWriting,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: const FaIcon(FontAwesomeIcons.angleLeft),
              onPressed: _backHomeScreen,
            ),
            actions: [
              IconButton(
                onPressed: _backHomeScreen,
                icon: const FaIcon(FontAwesomeIcons.sliders),
              ),
            ],
            elevation: 1,
            titleSpacing: 5,
            leadingWidth: 40,
            title: CupertinoSearchTextField(
              controller: _searchController,
              suffixIcon: const Icon(
                FontAwesomeIcons.solidCircleXmark,
                size: Sizes.size16,
                color: Colors.black38,
              ),
              onSuffixTap: _xmarkClick,
              itemColor: Colors.black,
            ),
            bottom: TabBar(
              onTap: _changeTab,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size3),
              splashFactory: NoSplash.splashFactory,
              indicatorColor: Colors.black,
              indicatorWeight: Sizes.size2,
              isScrollable: true,
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                  fontSize: Sizes.size14 + Sizes.size1,
                  fontWeight: FontWeight.w500),
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
          ),
          body: TabBarView(children: [
            GridView.builder(
              padding: const EdgeInsets.all(Sizes.size8),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size8,
                childAspectRatio: 9 / 20,
                mainAxisSpacing: Sizes.size8,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size5,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.fill,
                            placeholder: "assets/images/time.jpeg",
                            image:
                                "https://d1telmomo28umc.cloudfront.net/media/public/avatars/wlsdnr129-1675991977.jpg"),
                      ),
                    ),
                    Gaps.v8,
                    const Text(
                      "solongtextsolongtextsolongtextsolongtextsolongtextsolongtextsolongtextsolongtext",
                      style: TextStyle(
                          fontSize: Sizes.size16, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v3,
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: Sizes.size14,
                            child: Text("GT"),
                          ),
                          Gaps.h2,
                          Expanded(
                            child: Text(
                              "Gtaek_hello_my_name_happy",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              // style: TextStyle(
                              //     fontSize: Sizes.size14,
                              //     color: Colors.black38,
                              //     fontWeight: FontWeight.bold),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size14,
                            color: Colors.black38,
                          ),
                          Gaps.h2,
                          Text(
                            "2.0M",
                            // style: TextStyle(
                            //     color: Colors.black38, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
