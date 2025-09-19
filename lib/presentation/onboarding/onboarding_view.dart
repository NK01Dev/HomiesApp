
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:homies_app/presentation/base/base_view.dart';
import 'package:homies_app/presentation/onboarding/onboarding_viewmodel.dart';

class OnboardingView extends BaseView<OnboardingViewmodel, dynamic> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return viewContent;  }

  @override
  Widget showEmptyWidget({bool refresh = true}) {
    // TODO: implement showEmptyWidget
return Scaffold(
   body: Center(
     child: Text(' // TODO: implement showEmptyWidget'),
   ),
);
  }

  @override
  Widget showErrorWidget(String? error) {
    // TODO: implement showErrorWidget
    return Scaffold(
      body: Center(
        child: Text(' // TODO: implement showErrorWidget'),
      ),
    );  }

  @override
  Widget showMainView(state) {
    // TODO: implement showMainView
return Scaffold(
  body: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Onboard Screen'),
        ),
        TextButton(onPressed: () => controller.signOut(), child: Text('Logout'))
      ],
    ),
  ),
);
  }
}