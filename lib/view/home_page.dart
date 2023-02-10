import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ritmu_tv_clone/constant.dart';
import 'package:ritmu_tv_clone/view/draw_result_page.dart';

// import '../test.dart';
import 'live_tv_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: customAppbar()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => LiveTvPage());
                  // Get.to(() => TEST());
                },
                child: Image.asset('assets/live_tv.png', height: 170)),
            Text(
              'Live Tv ',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => DrawResultPage());
                },
                child: Image.asset('assets/draw_result.png', height: 160)),
            SizedBox(
              height: 10,
            ),
            Text(
              'Draw Result ',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
