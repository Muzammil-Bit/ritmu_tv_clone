// // import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pod_player/pod_player.dart';
// import 'package:ritmu_tv_clone/controllers/video_controller.dart';
// import 'package:video_player/video_player.dart';

// import '../vimeo_player/vimeo_player.dart';

// const VIDEO = '797504822';

// class LiveTvPage extends StatefulWidget {
//   const LiveTvPage({Key? key}) : super(key: key);

//   @override
//   State<LiveTvPage> createState() => _LiveTvPageState();
// }

// class _LiveTvPageState extends State<LiveTvPage> {
//   PodPlayerController? controller;

//   VideoController videoController = Get.find()..fetchVideo();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Obx(
//           () {
//             return videoController.isLoading.value
//                 ? CircularProgressIndicator(
//                     color: Colors.amber,
//                   )
//                 : VimeoVideoPlayer(
//                     vimeoPlayerModel: VimeoPlayerModel(
//                       // url: 'https://vimeo.com/${VIDEO}',
//                       url: 'https://vimeo.com/395212534',
//                       startAt: Duration(seconds: 10),
//                     ),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
