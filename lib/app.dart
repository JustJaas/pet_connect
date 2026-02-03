import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

import 'package:pet_connect/core/config/app_config.dart';
import 'package:pet_connect/core/theme/app_theme.dart';
import 'package:pet_connect/core/router/app_router.dart';
// import 'package:pet_connect/injection.dart';

// Importa tus BLoCs principales aquí
// import 'features/auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     // Aquí van los BLoCs globales (que necesitas en toda la app)
    //     // BlocProvider(create: (context) => getIt<AuthBloc>()),
    //   ],
    //   child: MaterialApp.router(
    //     title: 'Pet App',
    //     debugShowCheckedModeBanner: AppConfig.isDev, // Solo en dev
    //     theme: AppTheme.lightTheme,
    //     darkTheme: AppTheme.darkTheme,
    //     themeMode: ThemeMode.system,
    //     routerConfig: AppRouter.router,
    //   ),
    // );
    return MaterialApp.router(
      title: 'PetConnect',
      debugShowCheckedModeBanner: AppConfig.isDev, // Solo en dev
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
