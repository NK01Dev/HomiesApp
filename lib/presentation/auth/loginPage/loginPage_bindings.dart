import 'package:get/get.dart';
import 'package:homies_app/core/services/supabase_service.dart';
import 'package:homies_app/presentation/auth/login/login_viewmodel.dart';
import 'package:homies_app/presentation/auth/loginPage/loginPage_viewmodel.dart';
import 'package:homies_app/presentation/auth/register/regitser_viewmodel.dart';
import 'package:homies_app/presentation/base/base_bindings.dart';

class LoginpageBindings extends BaseBindings {
  @override
  void dependencies() {
    super.dependencies();
    // Initialize SupabaseService before ViewModel
    // Get.putAsync<SupabaseService>(() async => await SupabaseService().init());

    Get.lazyPut(() => LoginpageViewmodel());
  }

  @override
  Future clearDependencies() {
    //Get.delete<MainViewModel>();

    return super.clearDependencies();
  }
}