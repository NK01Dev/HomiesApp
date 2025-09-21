import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/themes/app_colors.dart';
import 'package:homies_app/core/utils/textStyleHelper.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/presentation/auth/register/regitser_viewmodel.dart';
import 'package:homies_app/presentation/base/base_view.dart';

import '../../../core/router/app_router.dart';

class RegisterView extends BaseView<RegisterViewModel, UserEntity> {
  final responsiveTextStyle = TextStyleHelper.textStyle18(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return viewContent;
  }

  @override
  Widget? showLoadingWidget() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16.h),
            Text("Creating your account..."),
          ],
        ),
      ),
    );
  }
  @override
  Widget showEmptyWidget({bool refresh = true}) {
    // TODO: implement showEmptyWidget
    return Scaffold(
      body: Center(child: Text("showEmptyWidget", style: responsiveTextStyle)),
    );  }

  @override
  Widget showErrorWidget(String? error) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            SizedBox(height: 16.h),
            Text("Registration Error",
                style: TextStyleHelper.textStyle16(color: Colors.red)),
            SizedBox(height: 8.h),
            Text(error ?? "Unknown error",
                style: TextStyleHelper.textStyle14(), textAlign: TextAlign.center),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () => controller.change(null, status: RxStatus.empty()),
              child: Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget showMainView(UserEntity? state) {
    // TODO: implement showMainView
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GetIt.I<AppRouter>().router.pop();
                  },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 24.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Register",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 120.sp,
                height: 90.sp,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  fontSize: 32.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Login to continue using the app',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.textLight,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            Obx(
              () => Form(
                key: controller.formKey,

                child: Padding(
                  padding: EdgeInsets.all(20.w), // Responsive padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.ltr,

                    children: [
                      Text('Username', style: TextStyleHelper.textStyle16()),
                      SizedBox(height: 5.sp),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyleHelper.textStyle14(color: Colors.black38),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4.sp,
                            ),
                          ),

                          // prefixIcon: Icon(Icons.clear)
                        ),
                        validator: controller.validateUsername,
                      ),
                      SizedBox(height: 20.sp),
                      Text('Email', style: TextStyleHelper.textStyle16()),
                      SizedBox(height: 5.sp),

                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          hintStyle: TextStyleHelper.textStyle14(color: Colors.black38),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4.sp,
                            ),
                          ),

                          suffixIcon: IconButton(
                            // Suffix icon (e.g., clear button)
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              controller.emailController.clear();
                            },
                          ),

                          // prefixIcon: Icon(Icons.clear)
                        ),
                        validator: controller.validateEmail,
                      ),
                      SizedBox(height: 20.sp),
                      Text('Password', style: TextStyleHelper.textStyle16()),
                      SizedBox(height: 5.sp),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller
                            .passwordVisible
                            .value, // 👈 toggle visibility

                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyleHelper.textStyle14(color: Colors.black38),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4.sp,
                            ),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              controller.passwordVisible.value =
                                  !controller.passwordVisible.value;
                            },

                            // prefixIcon: Icon(Icons.clear)
                          ),
                        ),
                        validator: controller.validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 20.sp),
                      Text(
                        'Confirm Password',
                        style: TextStyleHelper.textStyle16(),
                      ),
                      SizedBox(height: 5.sp),
                      TextFormField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller
                            .confirmPasswordVisible
                            .value, // 👈 toggle visibility

                        decoration: InputDecoration(
                          hintText: 'Enter your Confirm password',
                          hintStyle: TextStyleHelper.textStyle14(color: Colors.black38),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4.sp,
                            ),
                          ),

                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.confirmPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              controller.confirmPasswordVisible.value =
                                  !controller.confirmPasswordVisible.value;
                            },

                            // prefixIcon: Icon(Icons.clear)
                          ),
                        ),
                        validator: controller.validateConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.maxFinite,
                        height: 40.sp, // takes all available width

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => controller.register(),

                          child:controller.isLoading.value
                              ? CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          )
                              : Text(
                            "Register",
                            style: TextStyleHelper.textStyle16(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
