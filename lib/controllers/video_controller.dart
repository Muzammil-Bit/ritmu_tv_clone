import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ritmu_tv_clone/controllers/results_controller.dart';
import 'package:ritmu_tv_clone/models/video.dart';

import '../helpers/helpers.dart';

class VideoController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<Video> videos = RxList();

  fetchVideo() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(API_URL + 'video'));

      videos.value = Video.listFromMap(jsonDecode(response.body)['data']);
    } catch (e) {
      print("Error While Fetching video");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  String? get videoUrl {
    if (videos.length < 2) return null;

    var startTime = videos.firstWhere((element) => element.type == 'secondary').startTime;
    var endTime = videos.firstWhere((element) => element.type == 'secondary').endTime;
    final currentTime = DateTime.now();
    if (currentTime.isAfter(DateTime.parse(startTime!)) && currentTime.isBefore(DateTime.parse(endTime!))) {
      return videos.firstWhere((element) => element.type == 'secondary').url;
    }
    return videos.firstWhere((element) => element.type == 'secondary').url;
  }

  int get startAt {
    Video video = videos.firstWhere((element) => element.url == this.videoUrl);

    Duration different = DateTime.now().difference(video.updatedAt);

    return different.inSeconds;
  }
}
