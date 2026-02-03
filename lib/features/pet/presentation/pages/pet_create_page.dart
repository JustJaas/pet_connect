import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/core/theme/app_theme.dart';

class PetCreatePage extends StatefulWidget {
  const PetCreatePage({super.key});

  @override
  State<PetCreatePage> createState() => _PetCreatePageState();
}

class _PetCreatePageState extends State<PetCreatePage> {
  String selectedStatus = 'Perdido';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    typeController.dispose();
    breedController.dispose();
    ageController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF5F5F0),
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F0),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D2D2D)),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Nueva Publicación',
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Área de fotos con borde punteado
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {
                          // TODO: Abrir selector de imágenes
                        },
                        icon: const Icon(Icons.camera_alt, size: 20),
                        label: const Text('Añadir Fotos'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF2D2D2D),
                          side: const BorderSide(color: Color(0xFF2D2D2D)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Estado
              const Text(
                'Estado',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const SizedBox(height: 12),

              // Toggle de Estado
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStatus = 'Perdido';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedStatus == 'Perdido'
                                ? const Color(0xFFE88B7B)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Perdido',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selectedStatus == 'Perdido'
                                    ? Colors.white
                                    : const Color(0xFF2D2D2D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStatus = 'En Adopción';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedStatus == 'En Adopción'
                                ? const Color(0xFFE88B7B)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'En Adopción',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selectedStatus == 'En Adopción'
                                    ? Colors.white
                                    : const Color(0xFF2D2D2D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStatus = '¿Es tuyo?';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedStatus == '¿Es tuyo?'
                                ? const Color(0xFFE88B7B)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              '¿Es tuyo?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: selectedStatus == '¿Es tuyo?'
                                    ? Colors.white
                                    : const Color(0xFF2D2D2D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Información Básica
              const Text(
                'Información Básica',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const SizedBox(height: 12),

              _InputTextField(
                controller: nameController,
                label: 'Nombre de la mascota',
              ),

              const SizedBox(height: 12),

              _InputTextField(
                controller: typeController,
                label: 'Tipo de animal (ej. Perro, Gato)',
              ),

              const SizedBox(height: 12),

              _InputTextField(controller: breedController, label: 'Raza'),

              const SizedBox(height: 12),

              _InputTextField(controller: ageController, label: 'Edad'),

              const SizedBox(height: 32),

              // Ubicación
              const Text(
                'Ubicación',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _InputTextField(
                      controller: locationController,
                      label: 'Última vez visto / Zona de adopción',
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Abrir mapa
                      print('Abrir mapa');
                    },
                    icon: const Icon(Icons.map_outlined, size: 18),
                    label: const Text(
                      'Seleccionar\n  úbicación',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFE88B7B),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFE88B7B)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Descripción
              const Text(
                'Descripción y Características',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),

              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText:
                        'Añade una descripción detallada sobre tu mascota...',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Botón Publicar
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Validar y publicar
                    _handlePublish();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE88B7B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Publicar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePublish() {
    // Validación básica
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa el nombre de la mascota'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Aquí irá la lógica para publicar (BLoC/API)
    print('Estado: $selectedStatus');
    print('Nombre: ${nameController.text}');
    print('Tipo: ${typeController.text}');
    print('Raza: ${breedController.text}');
    print('Edad: ${ageController.text}');
    print('Ubicación: ${locationController.text}');
    print('Descripción: ${descriptionController.text}');

    // Mostrar confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Publicación creada exitosamente'),
        backgroundColor: Colors.green,
      ),
    );

    // Volver a la página anterior
    context.pop();
  }
}

class _InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _InputTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: TextField(
        controller: controller,
        style: const TextStyle(color: Color(0xFF2D2D2D)),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
