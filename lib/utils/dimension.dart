import 'package:flutter/material.dart';

GlobalKey<NavigatorState> curdex = GlobalKey<NavigatorState>();
double screenHeight = MediaQuery.of(curdex.currentContext!).size.height;
double screenWidth = MediaQuery.of(curdex.currentContext!).size.width;
