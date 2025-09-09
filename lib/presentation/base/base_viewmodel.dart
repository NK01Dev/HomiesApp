import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/utils.dart';
import '../../core/errors/failure.dart';

abstract class BaseViewModel<T> extends GetxController with StateMixin<T> {
  late StreamSubscription subscription;
  Rx<bool> networkStatus = true.obs;

  void refreshState() {
    throw UnimplementedError();
  }

  void onSuccess(T model) {
    RxStatus status = RxStatus.success();
    if (model is List && model.isEmpty) {
      status = RxStatus.empty();
    }
    change(model, status: status);
  }

  void onFailure(Failure failure) {
    change(state, status: RxStatus.error(failure.message));
    logMsg(failure.message);
  }

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
    subscription = Connectivity().onConnectivityChanged.listen((var result) {
      networkStatus.value = !result.contains(ConnectivityResult.none);
    });
    /*subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      networkStatus.value = result != ConnectivityResult.none;
    } as void Function(List<ConnectivityResult> event)?);*/
  }


  @mustCallSuper
  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }

  void changeStatus(RxStatus status) {
    change(state, status: status);
  }

  void clearState() {
    change(null);
  }

  showNoInternetMessage() {
    Get.showSnackbar(const GetSnackBar(
      maxWidth: AppConstants.maxWidthBottomSheet,
      duration: Duration(seconds: 3),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      message: "Prière de vérifier votre connexion internet",
    ));
  }

  showError(String message) {
    Get.showSnackbar(GetSnackBar(
      maxWidth: AppConstants.maxWidthBottomSheet,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      backgroundColor: Colors.red.shade900,
      snackPosition: SnackPosition.BOTTOM,
      message: message,
    ));
  }
}