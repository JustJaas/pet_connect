import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/core/theme/app_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Logo y título
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pets, color: Color(0xff8b9d6f), size: 35),

                  SizedBox(width: 10),
                  Text(
                    'PetConnect',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Imagen de ilustración
              Container(
                height: 380,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFD5BC),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/welcome.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback si no existe la imagen
                      return const Center(
                        child: Icon(
                          Icons.pets,
                          size: 120,
                          color: Color(0xFF8B9D6F),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Título principal
              const Text(
                'Conectando\ncorazones y hogares',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                  height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Subtítulo
              const Text(
                'Ayuda a encontrar a un amigo fiel o a reunir\na una mascota con su familia.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B6B6B),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Botón Crear una cuenta
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // context.go('/signup');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B9D6F),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Crear una cuenta',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Botón Iniciar Sesión
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // context.go('/login');
                    context.go('/pets');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8E8E8),
                    foregroundColor: const Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Términos y condiciones
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF9B9B9B),
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: 'Al continuar, aceptas nuestros '),
                    TextSpan(
                      text: 'Términos de Servicio',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: ' y\n'),
                    TextSpan(
                      text: 'Política de Privacidad',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
