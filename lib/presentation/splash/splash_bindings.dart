import 'package:get/get.dart';
import 'package:homies_app/presentation/splash/splash_viewmodel.dart';
import '../base/base_bindings.dart';

class SplashBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();

    Get.lazyPut(() => SplashViewModel());
  }

  @override
  Future clearDependencies() {
    //Get.delete<MainViewModel>();

    return super.clearDependencies();
  }
}