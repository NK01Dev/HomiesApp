import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/router/app_router.dart';
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
    await Future.delayed(const Duration(seconds: 5));
    GetIt.I<AppRouter>().router.go('/login');
  }

}