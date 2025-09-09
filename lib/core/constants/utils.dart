import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

logMsg(String message, {bool? error}) {
  if (kDebugMode) {
    (error ?? false) ? Get.find<Logger>().e(message) : Get.find<Logger>().i(message);
  }
}