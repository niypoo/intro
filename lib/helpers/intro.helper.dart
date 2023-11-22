import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intro/intro.binding.dart';
import 'package:intro/intro.view.dart';
import 'package:local_storage_service/localStorage.service.dart';

class IntroHelper {
  static const String localStorageKey = 'intro-key';

  static Future<void> showFirstTime(
    List<Widget> pages,
  ) async {
    // read local value
    final String? localValue = LocaleStorageService.to.instance
        .read('$localStorageKey-${AppConfigService.to.appName}');

    // skip
    if (localValue != null) return;

    // show intro
    show(pages);
  }

  // show intro
  static Future<void> show(List<Widget> pages) async {
    await Get.to(IntroView(pages: pages), binding: IntroBinding());
  }

  static Future<void> neverShowAgain() async {
    await LocaleStorageService.to.instance
        .write('$localStorageKey-${AppConfigService.to.appName}', true);
  }
}
