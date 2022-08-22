import 'package:flutter/cupertino.dart';
import 'package:news_app/views/main_page.dart';

class Routers with ChangeNotifier {
  ValueNotifier<Widget> now = ValueNotifier(const MainPage());
}
