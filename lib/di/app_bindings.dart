import 'package:get/get.dart';
import 'package:homies_app/core/services/supabase_service.dart';
import 'package:homies_app/data/datasources/remote_data_source.dart';
import 'package:homies_app/data/repositories/auth_repository.dart';
import 'package:homies_app/domain/repositories/AuthRepositoryInterface.dart';
import 'package:logger/logger.dart';

class AppBindings {
  static Future<void> init() async {
    // Enregistrer le Logger
    Get.lazyPut<Logger>(() => Logger(), fenix: true);
    // Register SupabaseService first (as it's a dependency for AuthRepository)
    await Get.putAsync<SupabaseService>(() async {
      final service = SupabaseService();
      return await service.init();
    }, permanent: true);

    // Then register AuthRepository
    Get.lazyPut<RemoteDataSource>(
          () => RemoteDataSource(Get.find<SupabaseService>()),
    );
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<SupabaseService>(), Get.find<RemoteDataSource>()),
    );

    // Add other global repositories/services as needed
  }
}