import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modul_pembelajaran_kimia/pages/InputNamePage.dart';
import 'package:video_player/video_player.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  late VideoPlayerController _controller;
  bool status = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/guide.mp4');
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(
      appBar:
          AppBar(title: Text("Video Petunjuk"), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            _controller.pause();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputName(),
              ),
            );
          },
          icon: Icon(Icons.skip_next),
        ),
      ]),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _controller.value.isInitialized
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: 24, top: 16, left: 16, right: 16),
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: 4 / 6,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            _ControlsOverlay(
                              controller: _controller,
                              onTap: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              },
                            ),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    ));
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller, this.onTap})
      : super(key: key);

  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 50),
                  reverseDuration: const Duration(milliseconds: 200),
                  child: controller.value.isPlaying
                      ? const SizedBox.shrink()
                      : Container(
                          // color: Colors.black26,
                          child: Center(
                            child: Icon(
                              controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 50.0,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: onTap,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton<double>(
                    initialValue: controller.value.playbackSpeed,
                    tooltip: 'Playback speed',
                    onSelected: (speed) {
                      controller.setPlaybackSpeed(speed);
                    },
                    itemBuilder: (context) {
                      return [
                        for (final speed in _examplePlaybackRates)
                          PopupMenuItem(
                            value: speed,
                            child: Text('${speed}x'),
                          )
                      ];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        // Using less vertical padding as the text is also longer
                        // horizontally, so it feels like it would need more spacing
                        // horizontally (matching the aspect ratio of the video).
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text('${controller.value.playbackSpeed}x'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
