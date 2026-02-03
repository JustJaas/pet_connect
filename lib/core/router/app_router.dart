import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:pet_connect/features/pet/presentation/pages/pet_create_page.dart';
import 'package:pet_connect/features/pet/presentation/pages/pet_detail_page.dart';
import 'package:pet_connect/features/pet/presentation/pages/pets_page.dart';
import 'package:pet_connect/features/welcome/pages/welcome_page.dart';

// Importa tus páginas aquí cuando las crees
// import '../../features/pets/presentation/pages/pets_list_page.dart';
// import '../../features/pets/presentation/pages/pet_detail_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
      // Agrega más rutas aquí
      GoRoute(path: '/pets', builder: (context, state) => const PetsPage()),

      GoRoute(
        path: '/pet/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PetDetailPage(petId: id);
        },
      ),

      GoRoute(
        path: '/create-pet',
        builder: (context, state) => const PetCreatePage(),
      ),

      // GoRoute(
      //   path: '/pet/:id',
      //   builder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return PetDetailPage(petId: id);
      //   },
      // ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

// Página de error
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Página no encontrada')),
    );
  }
}
