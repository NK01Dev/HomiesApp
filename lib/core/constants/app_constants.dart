import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const Duration apiTimeout = Duration(seconds: 30);

  // Hive id types
  static const int hiveTypeUser = 1;

  static const double maxWidthBottomSheet = 700;

  static String get appName => dotenv.env['APP_NAME'] ?? 'HomiesApp';
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static const String usersTable = 'users';
  static const String authTable = 'auth.users';
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
}
