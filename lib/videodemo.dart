import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videodemo extends StatefulWidget {
  const Videodemo({Key? key}) : super(key: key);

  @override
  _VideodemoState createState() => _VideodemoState();
}

class _VideodemoState extends State<Videodemo> {
  late VideoPlayerController _controller;
  bool isplaying = true;
  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset("assets/wp.mp4");
    _controller = VideoPlayerController.network(
        "https://vmlane.com/ios/raw/MobileDemo.mp4");
    initdata();
  }

  initdata() async {
    await _controller.initialize();
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height /
            _controller.value.aspectRatio,
        child: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                    setState(() {
                      isplaying = false;
                    });
                  } else {
                    _controller.play();
                    setState(() {
                      isplaying = true;
                    });
                  }
                },
                child: VideoPlayer(_controller)),
            if (!isplaying) ...[
              Center(
                  child: Icon(
                Icons.play_circle,
                color: Colors.amber,
                size: 50,
              ))
            ],
          ],
        ),
      ),
    );
  }
}
