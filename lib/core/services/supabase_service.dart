import 'package:homies_app/core/constants/app_constants.dart';
import 'package:homies_app/core/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class SupabaseService extends GetxService {
  static SupabaseService get to => Get.find();

  late final SupabaseClient client;
  late final GoTrueClient auth;

  Future<SupabaseService> init() async {
    try {
      await Supabase.initialize(
        url: AppConstants.supabaseUrl,
        anonKey: AppConstants.supabaseAnonKey,
        // Add web-specific configuration
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
          // Enable persistence for web
          autoRefreshToken: true,
        ),
        // Optional: Add realtime for web if needed
        realtimeClientOptions: const RealtimeClientOptions(
          logLevel: RealtimeLogLevel.info,
        ),
      );

      client = Supabase.instance.client;
      auth = client.auth;

      AppLogger.info('Supabase initialized successfully.');
      return this;
    } catch (e) {
      AppLogger.error('Failed to initialize Supabase: $e');
      rethrow;
    }
  }
  Future<void> signOut() async {
    await auth.signOut();
  }
}