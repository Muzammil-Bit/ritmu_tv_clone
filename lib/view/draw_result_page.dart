import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:ritmu_tv_clone/constant.dart';
import 'package:ritmu_tv_clone/controllers/results_controller.dart';
import 'package:ritmu_tv_clone/helpers/helpers.dart';

class DrawResultPage extends StatefulWidget {
  const DrawResultPage({Key? key}) : super(key: key);

  @override
  State<DrawResultPage> createState() => _DrawResultPageState();
}

class _DrawResultPageState extends State<DrawResultPage> {
  List<String> title = [
    '09:00:00',
    '10:00:00',
    '11:00:00',
    '12:00:00',
  ];
  List<String> subTitle = [
    'RITMU SUPER 4 1st(4118) 2nd(2067)*(8308)*0193',
    'PICK 4(8613)',
    'RITMU SUPER 4 1st(4118) 2nd(2067)*(8308)*0193',
    'PICK 4(8613)',
  ];

  final ResultsController _resultsController = Get.find()..fetchResults();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: customAppbar(),
      ),
      body: Obx(() {
        return LoadingOverlay(
          isLoading: _resultsController.isLoading.value,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Text(
                        '${formateDate(_resultsController.date.value.subtract(Duration(days: 1)))} to ${formateDate(_resultsController.date.value)}',
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                      );
                    }),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );

                        if (dateTime != null) {
                          _resultsController.date.value = dateTime;
                          _resultsController.fetchResults();
                        }
                      },
                      child: Icon(Icons.calendar_today_outlined),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time',
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                    ),
                    Text(
                      'Draw',
                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 45,
                color: primaryColor,
                width: double.infinity,
                child: Center(
                  child: Obx(() {
                    return Text(
                      '${formateDateTime(_resultsController.date.value)}',
                      // 'Thursday, Feb 2,2023',
                      style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 22),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                child: Obx(() {
                  return ListView.builder(
                    itemCount: _resultsController.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${formateTime(_resultsController.results[index].time)}',
                                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                                ),
                                Container(
                                  width: 120,
                                  child: Text(
                                    '${_resultsController.results[index].result}',
                                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: primaryColor,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
              )
            ],
          ),
        );
      }),
    );
  }
}
