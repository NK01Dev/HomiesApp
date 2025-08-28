import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String appName = dotenv.env['APP_NAME'] ?? 'HomiesApp';
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
}
