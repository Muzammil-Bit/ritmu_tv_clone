import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ritmu_tv_clone/controllers/results_controller.dart';

import '../helpers/helpers.dart';

class VideoController extends GetxController {
  RxBool isLoading = false.obs;

  RxMap video = {}.obs;

  fetchVideo() async {
    isLoading(true);
    try {
      var response = await http.get(Uri.parse(API_URL + 'video'));

      print("API RESPONSE :: ${response.body}");

      video.value = jsonDecode(response.body)['data'];
    } catch (e) {
      print("Error While Fetching video");
    } finally {
      isLoading(false);
    }
  }
}
