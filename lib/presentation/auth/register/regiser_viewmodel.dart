import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:homies_app/presentation/auth/login/login_viewmodel.dart';
import 'package:homies_app/presentation/base/base_bindings.dart';
import 'package:homies_app/presentation/base/base_viewmodel.dart';

class RegiserViewmodel extends BaseViewModel<UserEntity> {
///GlobalKey<FormState> → remote control of the form.
  final formKey =GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading; // 👈 add this getter
  RxBool passwordVisible = false.obs;
  RxBool confirmPasswordVisible = false.obs;

  ///TextEditingController → keeps the text of each input.
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController = TextEditingController();
  // Add repository dependency
  final AuthRepository _authRepository = Get.find();
  ///validator function → rules for each field.
String? validateUsername(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Username is required";
  }
  if (value.length < 3) {
    return "At least 3 characters";
  }
  return null;
}

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

  String? validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      _isLoading.value = true; // start loading

      try {
        // Use change() to update state with loading
        change(null, status: RxStatus.loading());
        if (emailController.text != null && passwordController.text != null) {
          Get.snackbar('Info', 'Trying to register...');
        } else {
          Get.snackbar('Error', 'Email or password is null');
        }

        final user = await _authRepository.signUp(
          email: emailController.text.trim(),
          password: passwordController.text,
          userName: usernameController.text.trim(),
        );

        // Update state with success
        change(user, status: RxStatus.success());

        Get.snackbar("Success", "Account created successfully ✅");
        formKey.currentState?.reset();

        // Navigate after a short delay to show success message
        await Future.delayed(Duration(seconds: 1));
        Get.offAllNamed(pageName.auth);

      } catch (e) {
        // Update state with error
        change(null, status: RxStatus.error(e.toString()));
        Get.snackbar("Error", "Registration failed: ${e.toString()}");
      }finally {
        _isLoading.value = false; // stop loading
      }
    } else {
      Get.snackbar("Error", "Please fix errors ❌");
    }
  }
  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

}