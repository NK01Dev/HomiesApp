import 'package:get/get_core/src/get_main.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/domain/entities/user_entity.dart';
import 'package:homies_app/presentation/base/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel<UserEntity> {

  void toRegister()async{
    GetIt.I<AppRouter>().router.push( pageName.register);

  }
  void toLogin()async{
    GetIt.I<AppRouter>().router.push( pageName.login);}
}
