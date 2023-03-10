import 'package:flutter/material.dart';
import 'package:tiktok_clone/video/widget/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  final Duration _duration = const Duration(milliseconds: 300);
  final Curve _curve = Curves.linear;

  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _duration,
      curve: _curve,
    );

    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
    }
    setState(() {});
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: _duration,
    //   curve: _curve,
    // );
  }

  @override
  void dispose() {
    _pageController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) =>
          VideoPost(autoPageChanged: _onVideoFinished, index: index),
      scrollDirection: Axis.vertical,
    );
  }
}
