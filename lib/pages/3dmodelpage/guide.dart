import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modul_pembelajaran_kimia/pages/InputNamePage.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _controller.value.isInitialized
                ? Container(
                    padding: EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height / 2,
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
                  )
                : Container(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 250,
                  // child: Center(
                  //   child: CheckboxListTile(
                  //       title: Text('Jangan Tampilkan Lagi'),
                  //       controlAffinity: ListTileControlAffinity.leading,
                  //       value: this.status,
                  //       onChanged: (value) async {
                  //         setState(() {
                  //           status = !status;
                  //         });
                  //         print(status);
                  //       }),
                  // ),
                ),
                InkWell(
                  onTap: () async {
                    // final SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // prefs.setBool("guideStatus", status);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InputName()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Tutup",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                )
              ],
            )
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
