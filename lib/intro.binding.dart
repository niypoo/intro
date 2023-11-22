import 'package:get/get.dart';
import 'package:intro/intro.controller.dart';

class IntroBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<IntroController>(() => IntroController());
  }
}