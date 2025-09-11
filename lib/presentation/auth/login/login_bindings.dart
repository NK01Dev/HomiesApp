import 'package:get/get.dart';
import 'package:homies_app/presentation/base/base_bindings.dart';
import 'login_viewmodel.dart';

class LoginBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();

    Get.lazyPut(() => LoginViewModel());
  }

  @override
  Future clearDependencies() {
    //Get.delete<MainViewModel>();

    return super.clearDependencies();
  }
}