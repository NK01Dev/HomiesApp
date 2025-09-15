import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/presentation/auth/login/login_viewmodel.dart';
import 'package:homies_app/presentation/base/base_bindings.dart';
import 'package:homies_app/presentation/base/base_viewmodel.dart';

class RegiserViewmodel extends BaseViewModel<UserEntity> {
///GlobalKey<FormState> → remote control of the form.
  final formKey =GlobalKey<FormState>();


  ///TextEditingController → keeps the text of each input.
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController = TextEditingController();

  ///validator function → rules for each field.
String? validateUsername(String value) {
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
      return "Invalid email format";
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

  void register()async {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form is valid ✅");
      formKey.currentState?.reset();

    } else {
      Get.snackbar("Error", "Please fix errors ❌");
    }
  }


}