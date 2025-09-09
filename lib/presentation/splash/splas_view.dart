import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homies_app/core/themes/app_colors.dart';
import 'package:homies_app/presentation/splash/splash_viewmodel.dart';

import '../../core/themes/app_theme.dart';
import '../base/base_view.dart';

class SplashView extends BaseView<SplashViewModel, dynamic> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: viewContent);
  }

  @override
  Widget? showLoadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 60, maxHeight: 60),
        child: CircularProgressIndicator(color: AppColors.accent),
      ),
    );
  }

  @override
  Widget showEmptyWidget({bool refresh = true}) {
    return const Text("empty view");
  }

  @override
  Widget showErrorWidget(String? error) {
    return Text(error ?? "erreur");
  }

  @override
  Widget showMainView(state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.background,
      child: Center(
        child: Hero(
          tag: 'logo',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/images/logo/Google-flutter-logo.png',
              //   height: 220,
              //   width: 220,
              // ),
              const SizedBox(height: 30),
              const Text(
                'Hello in my Boiler Plate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textLight,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
