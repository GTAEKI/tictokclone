import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/video/screens/coment_sheet_screen.dart';
import 'package:tiktok_clone/features/video/widget/id_coment.dart';
import 'package:tiktok_clone/features/video/widget/video_emoji.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final autoPageChanged;
  final index;

  const VideoPost({
    super.key,
    required this.autoPageChanged,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  bool _isPaused = false;
  bool _changeSentence = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/outside_video.mp4");

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.addListener(_videoFinished);
  }

  void _videoFinished() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.autoPageChanged();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
    // 애니메이션 첫번째 방법
    // _animationController.addListener(
    //   () {
    //     setState(
    //       () {},
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _videoPlayerController.pause();
    }
  }

  _togglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  _seeMore() {
    _changeSentence = !_changeSentence;
    setState(() {});
  }

  _onBottomSheet(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _togglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ComentBottomScreen(),
    );
    _togglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.teal,
                  ),
          ),
          Positioned.fill(
            //Toggle 제스쳐디텍터
            child: GestureDetector(
              onTap: _togglePause,
            ),
          ),
          Positioned.fill(
            //Play버튼,Pause
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animationController.value,
                  child: child,
                );
              },
              child: AnimatedOpacity(
                opacity: _isPaused ? 1 : 0,
                duration: _animationDuration,
                child: const IgnorePointer(
                  child: Center(
                      child: FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size64,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: _animationDuration,
                  child: _changeSentence
                      ? const VideoComent(
                          id: "@GTAEK",
                          coment:
                              "It's in front of my house!!!\ntoday is very nice weather\n",
                        )
                      : const VideoComent(
                          id: "@GTAEK",
                          coment: "It's in front of my house",
                        ),
                ),
                GestureDetector(
                  onTap: _seeMore,
                  child: SizedBox(
                    child: _changeSentence
                        ? const Text(
                            "..down",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const Text(
                            "..See more",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: Column(
              children: [
                const CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/125863048?v=4"),
                  radius: 20,
                ),
                Gaps.v28,
                const VideoEmoji(
                    count: "2.9M", icon: FontAwesomeIcons.solidHeart),
                Gaps.v28,
                GestureDetector(
                  onTap: () => _onBottomSheet(context),
                  child: const VideoEmoji(
                      count: "33.0K", icon: FontAwesomeIcons.solidCommentDots),
                ),
                Gaps.v28,
                const VideoEmoji(count: "Share", icon: FontAwesomeIcons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
