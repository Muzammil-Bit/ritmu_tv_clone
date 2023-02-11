import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ritmu_tv_clone/controllers/results_controller.dart';
import 'package:ritmu_tv_clone/models/video.dart';

import '../helpers/helpers.dart';

class VideoController extends GetxController {
  RxBool isLoading = false.obs;

  RxMap video = {}.obs;

  Future<List<Video>> fetchVideo() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(API_URL + 'video'));

      return Video.listFromMap(jsonDecode(response.body)['data']);
    } catch (e) {
      print("Error While Fetching video");
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
