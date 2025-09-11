// injection.dart
import 'package:get_it/get_it.dart';
import 'package:homies_app/di/injection.config.dart';
import 'package:injectable/injectable.dart';
final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async => $initGetIt(getIt);