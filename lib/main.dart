import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:homies_app/core/router/app_router.dart';
import 'package:homies_app/di/app_bindings.dart';
import 'package:homies_app/di/init_app_module.dart';
import 'package:homies_app/di/injection.dart';
import 'package:homies_app/presentation/splash/splas_view.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    // Initialize all app modules and dependencies FIRST
    await initAppModule();

    await configureDependencies(); // injectable / get_it
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      /*  GoRouter needs the real navigator key to work with GetX dialogs/snackbars  */
      final router = GetIt.I<AppRouter>().router;

      return ScreenUtilInit(
       designSize: const Size(390, 844),
       minTextAdapt: true,
       splitScreenMode: true,
       builder: (context, child) {
         return GetMaterialApp.router(
           
           routeInformationParser: router.routeInformationParser,
           routerDelegate: router.routerDelegate,
           routeInformationProvider: router.routeInformationProvider, // optional
           debugShowCheckedModeBanner: false,
           title: 'Homies',
         );
       },
     );
    }
  }


