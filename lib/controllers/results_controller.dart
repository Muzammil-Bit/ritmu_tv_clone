import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ritmu_tv_clone/models/result.dart';
import 'package:http/http.dart' as http;

import '../helpers/helpers.dart';

const API_URL = 'https://expense.lemonappsg.com/public/api/';

class ResultsController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<Result> results = RxList();
  late Rx<DateTime> date;

  ResultsController() {
    date = Rx(DateTime.now());
  }

  fetchResults() async {
    isLoading(true);
    try {
      results.value = [];
      var response = await http.get(Uri.parse(API_URL + 'result_by_date?time=' + formateDateForAPI(date.value)));

      print("API RESPONSE :: ${response.body}");

      results.value = Result.listFromMap(jsonDecode(response.body)['data']);

      if (results.length == 0) {
        Fluttertoast.showToast(msg: "No Results data found");
      }
    } catch (e) {
      print("Error");
    } finally {
      isLoading(false);
    }
  }
}
