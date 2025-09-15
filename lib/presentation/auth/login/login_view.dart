import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/core/themes/app_colors.dart';
import 'package:homies_app/core/utils/textStyleHelper.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/presentation/auth/login/login_viewmodel.dart';
import 'package:homies_app/presentation/base/base_view.dart';

class LoginView extends BaseView<LoginViewModel, UserEntity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return viewContent;
  }

  @override
  Widget showEmptyWidget({bool refresh = true}) {
    // TODO: implement showEmptyWidget
    final responsiveTextStyle = TextStyleHelper.textStyle18(color: Colors.blue);

    return Scaffold(
      body: Center(
        child: Text('showEmptyWidget !', style: responsiveTextStyle),
      ),
    );
  }

  @override
  Widget showErrorWidget(String? error) {
    // TODO: implement showErrorWidget
    final responsiveTextStyle = TextStyleHelper.textStyle18(color: Colors.blue);

    return Scaffold(
      body: Center(
        child: Text('Login have Error!', style: responsiveTextStyle),
      ),
    );
  }

  @override
  Widget showMainView(UserEntity? state) {
    // TODO: implement showMainView
    final responsiveTextStyle = TextStyleHelper.textStyle18(color: Colors.blue);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        // title: Text(
        //   'Login Page',
        //   style: TextStyleHelper.textStyle16(color: Colors.white),
        // ),
        backgroundColor: AppColors.primaryLight,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Image.asset(
              'assets/images/image_1.png',
              width: 410.w,
              height: 270.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Everything you need in one place',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 32.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome! Manage all your household tasks, collaborate on projects, and track your expenses with your homies.',
                textAlign: TextAlign.center,
                style: TextStyleHelper.textStyle16(color: Colors.grey.shade700),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // باش ياخد كامل العرض

                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      AppColors.primary,
                    ),
                    padding: MaterialStateProperty.all(
                      // ✅
                      EdgeInsets.symmetric(vertical: 20.sp), // ارتفاع الزر
                    ),
                  ),
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.textStyle16(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // باش ياخد كامل العرض
                child: OutlinedButton(
                  onPressed: () {
controller.toRegister();                  },
                  child: Text(
                    "Register",

                    textAlign: TextAlign.center,
                    style: TextStyleHelper.textStyle16(color: Colors.black),
                  ),
                  style: OutlinedButton.styleFrom(
                           side: BorderSide(color: Colors.black, width: 2), // Red border, 2px wide
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
    ),
                        padding:  EdgeInsets.symmetric(vertical: 20.sp),





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
