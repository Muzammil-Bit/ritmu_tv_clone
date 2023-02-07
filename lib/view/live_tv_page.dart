import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/material.dart';

class LiveTvPage extends StatefulWidget {
  const LiveTvPage({Key? key}) : super(key: key);

  @override
  State<LiveTvPage> createState() => _LiveTvPageState();
}

class _LiveTvPageState extends State<LiveTvPage> {
  final ApiVideoLiveStreamController _controller = ApiVideoLiveStreamController(initialAudioConfig: AudioConfig(), initialVideoConfig: VideoConfig.withDefaultBitrate());

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  init() async {
    await _controller.startStreaming(
      url: 'https://embed.api.video/vod/vi2NcENcGeKc4c1rIDgsv4Yx',
      streamKey: '8BGYGRfPuqs6zaFHafdzNPgP6Uim44mkyKHHYkr1CfH',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ApiVideoCameraPreview(controller: _controller),
      ),
    );
  }
}
