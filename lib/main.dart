import 'package:flutter/material.dart';
import 'package:news_app/models/routers.dart';
import 'package:news_app/utils/dimension.dart';
import 'package:request_api_helper/request.dart';
import 'package:request_api_helper/request_api_helper.dart';

Routers routers = Routers();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RequestApiHelper.init(RequestApiHelperData(
    navigatorKey: curdex,
    baseUrl: 'https://newsapi.org',
    debug: true,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: curdex,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueListenableBuilder<Widget>(
        valueListenable: routers.now,
        builder: (_, value, __) {
          return value;
        },
      ),
    );
  }
}
