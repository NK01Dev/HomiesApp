import 'package:get/get.dart';
import 'package:homies_app/presentation/auth/register/regiser_viewmodel.dart';
import 'package:homies_app/presentation/base/base_bindings.dart';

class RegisterBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();

    Get.lazyPut(() => RegiserViewmodel());
  }

  @override
  Future clearDependencies() {
    //Get.delete<MainViewModel>();

    return super.clearDependencies();
  }
}