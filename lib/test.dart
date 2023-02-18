import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ritmu_tv_clone/controllers/video_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeoplayer_mam/vimeoplayer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _shouldShowContainer = true;
  bool _initialTimeSet = false;
  YoutubePlayerController? _controller;

  VideoController _videoController = Get.find();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _videoController.fetchVideo();
    });

    _videoController.videos.listen((p0) {
      if (_videoController.videoUrl != null && mounted)
        setState(() {
          try {
            _controller = YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(_videoController.videoUrl!)!,
              flags: YoutubePlayerFlags(
                autoPlay: true,
                loop: true,
                disableDragSeek: true,
                enableCaption: false,
                hideControls: true,
                showLiveFullscreenButton: false,
                mute: false,
                hideThumbnail: true,
              ),
            );

            _controller!.addListener(setInitialVideoStartPosition);
          } catch (e) {}
        });
    });
  }

  setInitialVideoStartPosition() {
    if (_initialTimeSet) return;

    if (_controller!.metadata.author.trim().length != 0) {
      _controller!.seekTo(Duration(seconds: _videoController.startAt % _controller!.value.metaData.duration.inSeconds));
      _initialTimeSet = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller == null
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  Container(
                    height: 250,
                    child: YoutubePlayer(
                      onReady: () => _hideThumbNail(),
                      controller: _controller!,
                      progressColors: ProgressBarColors(
                        handleColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        bufferedColor: Colors.transparent,
                        playedColor: Colors.transparent,
                      ),
                      thumbnail: Container(
                        height: 250,
                        width: double.infinity,
                        color: Colors.white,
                        child: Image.asset('assets/live_tv.png'),
                      ),
                      controlsTimeOut: Duration.zero,
                      progressIndicatorColor: Colors.transparent,
                      liveUIColor: Colors.transparent,
                      showVideoProgressIndicator: false,
                      bottomActions: [],
                      topActions: [],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    height: 250,
                    color: _shouldShowContainer ? Colors.white : Colors.transparent,
                    alignment: Alignment.center,
                    child: _shouldShowContainer ? CircularProgressIndicator() : null,
                  )
                ],
              ),
      ),
    );
  }

  _hideThumbNail() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      _shouldShowContainer = false;
    });
  }
}
