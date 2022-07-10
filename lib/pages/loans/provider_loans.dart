import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../../models/loan_repay_model.dart';
import '../../models/loans_model.dart';

import 'package:http/http.dart' as http;
class MyHomePageProvider extends ChangeNotifier{
  AutoGenerate data;
  AutoGenerate3 data3;

  Future getData(context,String uid) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    var response = await http.get(Uri.parse('https://winnerssacco.org/admin/api/api/loan/get_customer_loans.php?id=$uid'));
    // now we have response as String from local json or and API request...
    var mJson = json.decode(response.body);
    // now we have a json...
    data = AutoGenerate.fromJson(mJson);
    notifyListeners(); // for callback to view
  }

  Future getData2(context,String uid,String lno) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    var response = await http.get(Uri.parse('https://winnerssacco.org/admin/api/api/loan/all_loan_repayments_single_app.php?id=$lno'));
    // now we have response as String from local json or and API request...
    var mJson = json.decode(response.body);
    // now we have a json...
    data3 = AutoGenerate3.fromJson(mJson);
    notifyListeners(); // for callback to view
  }
}