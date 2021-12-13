import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vizeo_theme/vizeo_theme.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VzText.typePrimary(
              data: "Second Screen",
            ),
            VzButton.typePrimary(
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
