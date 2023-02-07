import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveTvPage extends StatefulWidget {
  const LiveTvPage({Key? key}) : super(key: key);

  @override
  State<LiveTvPage> createState() => _LiveTvPageState();
}

class _LiveTvPageState extends State<LiveTvPage> {
  // final ApiVideoLiveStreamController _controller = ApiVideoLiveStreamController(initialAudioConfig: AudioConfig(), initialVideoConfig: VideoConfig.withDefaultBitrate());

  FlickManager? flickManager;
  VideoPlayerController? videoPlayerController;

  final vidURL = 'https://expense.lemonappsg.com/public/uploads/Test Video.mp4';
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(vidURL);
    flickManager = FlickManager(videoPlayerController: videoPlayerController!, autoInitialize: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    flickManager?.dispose();
    videoPlayerController?.dispose();
  }

  // init() async {
  //   await _controller.startStreaming(
  //     url: 'https://expense.lemonappsg.com/public/uploads/Test Video.mp4',
  //     streamKey: '8BGYGRfPuqs6zaFHafdzNPgP6Uim44mkyKHHYkr1CfH',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 300,
          alignment: Alignment.center,
          child: flickManager == null
              ? CircularProgressIndicator(
                  color: Colors.red,
                )
              : FlickVideoPlayer(
                  flickManager: flickManager!,
                  flickVideoWithControls: FlickVideoWithControls(),
                ),
        ),
      ),
    );
  }
}
