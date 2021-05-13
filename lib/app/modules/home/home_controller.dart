import 'package:flutter/material.dart';

class HomeController {
  final pageViewController = PageController();
  ValueNotifier<double> scrollNotifier = ValueNotifier(0.0);

    void listener() {
    scrollNotifier.value = pageViewController.page!;
  }


}