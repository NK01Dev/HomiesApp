import 'package:homies_app/di/app_bindings.dart';

Future<void> initAppModule() async {
  // Initialize all global dependencies
  await AppBindings.init();
}