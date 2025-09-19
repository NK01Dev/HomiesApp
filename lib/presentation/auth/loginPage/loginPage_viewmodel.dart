import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/constants/utils.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/data/models/user_model.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:homies_app/presentation/base/base_viewmodel.dart';

class LoginpageViewmodel extends BaseViewModel<UserEntity> {

  ///GlobalKey<FormState> → remote control of the form.
  final formKey =GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  // Add repository dependency
  final AuthRepository _authRepository = Get.find();
  final Rx<UserEntity?> currentUser = Rx<UserEntity?>(null);

  RxBool get isLoading => _isLoading; // 👈 add this getter
  RxBool passwordVisible = true.obs;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    }
    if (value.length < 6) {
      return "Min 6 characters";
    }
    return null;
  }
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      // Get.snackbar("Error", "Please fix errors ❌");
      logMsg("Error Please fix errors ❌");
      errorMessage.value = '';

      return;
    }
    _isLoading.value = true; // ✅ start loading

    try {
      logMsg('Starting registration with:');
      logMsg('Email: ${emailController.text}');
      final user = await _authRepository.signIn(
        emailController.text.trim(),
        passwordController.text,
      );
      logMsg('Registration successful: ${user.id}');

      // SUCCÈS
      change(user, status: RxStatus.success());
      currentUser.value = user;

      // Get.snackbar("Success", "Welcome back, ${user.userName}! ✅");
      formKey.currentState?.reset();

      // Naviguer après un délai
      await Future.delayed(const Duration(seconds: 2));
      // Get.offAllNamed(pageName.onboard);
      GetIt.I<AppRouter>().router.go(pageName.onboard);

    } catch (e, stackTrace) {
      logMsg('Registration error: $e');
      logMsg('Stack trace: $stackTrace');
      errorMessage.value = e.toString();

      // ERREUR
      change(null, status: RxStatus.error(e.toString()));
      // Get.snackbar("Error", "Registration failed: ${e.toString()}");
    } finally {
      emailController.clear();
      passwordController.clear();
      _isLoading.value = false;
    }
  }
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

}