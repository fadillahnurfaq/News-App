import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:request_api_helper/request.dart';
import 'package:request_api_helper/request_api_helper.dart';

class NewsC with ChangeNotifier {
  static ValueNotifier<News?> newsList = ValueNotifier(null);

  static getNewList() {
    RequestApiHelper.sendRequest(
        type: Api.get,
        url:
            '/v2/top-headlines?country=us&apiKey=587c1e5ca9164aac9a830683bca57af3',
        runInBackground: true,
        config: RequestApiHelperData(onSuccess: (data) {
          // print(data);
          newsList.value = News.fromJson(data);
          newsList.notifyListeners();
        }));
  }
}
