import 'package:homies_app/core/constants/app_constants.dart';
import 'package:homies_app/core/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

class SupabaseService extends GetxService {
  static SupabaseService get to => Get.find();

  late final SupabaseClient client;
  late final GoTrueClient auth;

  Future<SupabaseService> init() async {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
    );

    client = Supabase.instance.client;
    AppLogger.info('Supabase initialized successfully.');

    auth = client.auth;

    return this;
  }
}