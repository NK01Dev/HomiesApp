import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/constants/utils.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:homies_app/presentation/base/base_viewmodel.dart';

class OnboardingViewmodel extends BaseViewModel {
  final AuthRepository _authRepository = Get.find();
  Future<void> signOut() async {
  try {
    await _authRepository.signOut();
    GetIt.I<AppRouter>().router.go(pageName.auth);

  }catch (e) {
    logMsg('Sign out error: $e');
  }
  }

  }