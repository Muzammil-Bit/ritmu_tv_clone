import 'package:flutter/material.dart';
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
  bool shouldShowContainer = true;

  _hideThumbNail() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      shouldShowContainer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder(
            future: VideoController().fetchVideo(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              if (snapshot.hasError) return Text("Error");

              YoutubePlayerController _controller = YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(snapshot.data![0].url)!,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  loop: true,
                  disableDragSeek: true,
                  enableCaption: false,
                  hideControls: true,
                  showLiveFullscreenButton: false,
                  mute: false,
                  startAt: 40,
                ),
              );
              return Stack(
                children: [
                  Container(
                    height: 250,
                    child: YoutubePlayer(
                      onReady: () => _hideThumbNail(),
                      controller: _controller,
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
                    color: shouldShowContainer ? Colors.white : Colors.transparent,
                    alignment: Alignment.center,
                    child: shouldShowContainer ? CircularProgressIndicator() : null,
                  )
                ],
              );
            }),
      ),
    );
  }
}
