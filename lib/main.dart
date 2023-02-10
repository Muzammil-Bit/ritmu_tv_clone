import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritmu_tv_clone/controllers/video_controller.dart';
import 'package:ritmu_tv_clone/view/home_page.dart';

import 'controllers/results_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResultsController());
    Get.put(VideoController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ritmu Clone',
      home: HomePage(),
    );
  }
}
