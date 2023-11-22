import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/mutliStepsProgress.widget.dart';
import 'package:get/get.dart';
import 'package:intro/intro.controller.dart';

class IntroView extends StatelessWidget {
  const IntroView({
    super.key,
    required this.pages,
  });

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      // body
      child:
          // Progress
          GetBuilder<IntroController>(
        init: IntroController(),
        autoRemove: false,
        builder: (controller) => Column(
          children: [
            // Progress
            FlyMultiStepsProgress(
              total: pages.length,
              step: controller.step,
              onTapCancel: () => Get.back(),
              onTapBack: controller.back,
            ),

            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
