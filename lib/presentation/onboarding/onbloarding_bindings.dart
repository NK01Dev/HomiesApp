import 'package:get/get.dart';
import 'package:homies_app/presentation/onboarding/onboarding_viewmodel.dart';
import '../base/base_bindings.dart';

class OnbloardingBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();

    Get.lazyPut(() => OnboardingViewmodel());
  }

  @override
  Future clearDependencies() {
    //Get.delete<MainViewModel>();

    return super.clearDependencies();
  }
}