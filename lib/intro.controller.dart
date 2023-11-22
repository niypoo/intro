import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intro/helpers/intro.helper.dart';

class IntroController extends GetxController {
  static IntroController get to => Get.find();

  // pages View
  final PageController pageController = PageController();
  int step = 1;

  // move next step
  next() {
    pageController.nextPage(
      duration: AppConfigService.to.duration,
      curve: AppConfigService.to.curve,
    );

    // increment
    step = step + 1;

    // update widget
    update();
  }

  // move back step
  back() {
    pageController.previousPage(
      duration: AppConfigService.to.duration,
      curve: AppConfigService.to.curve,
    );

    // increment
    step = step - 1;

    // update widget
    update();
  }

  close() async {
    await IntroHelper.neverShowAgain();
    Get.back();
  }
}
