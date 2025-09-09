import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:homies_app/core/router/routes.dart';

import '../../core/utils/throttler.dart';
import '../base/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel {
  final Throttler _throttler = Throttler();
  //final ISettingsRepository _settingsRepository = Get.find<ISettingsRepository>();

  @override
  void onReady() {
    _initializeApp();
  }

  void _initializeApp() async {

    _throttler.throttle(
          () => Navigator.of(Get.context!).pushReplacementNamed(
        // introductionRoute,
        //weatherRoute,
        homeRoute,
      ),
      duration: const Duration(seconds: 5),
    );
  }
}