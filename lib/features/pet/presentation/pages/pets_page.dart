import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_connect/core/theme/app_theme.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Text(
          'Mascotas Cerca',
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          // Botón de búsqueda
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF2D2D2D)),
            onPressed: () {
              // TODO: Navegar a búsqueda
              print('Búsqueda presionado');
            },
          ),

          // Botón de notificaciones con badge
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Color(0xff2d2d2d),
                ),
              ),
              // Badge de notificación
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF6584),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(minWidth: 8, minHeight: 8),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const FilterSection(label: 'Todos', color: Color(0xfff5a65b)),
                const SizedBox(width: 5),
                FilterSection(label: 'Perdidos', color: Colors.green[100]!),
                const SizedBox(width: 5),
                FilterSection(label: 'En Adopción', color: Colors.green[100]!),
                const SizedBox(width: 5),
                FilterSection(label: 'Cerca', color: Colors.green[100]!),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                PetCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
                  title: 'Se busca a Rocky',
                  location: 'Palermo, CABA',
                  time: 'Hace 2 horas',
                  status: 'Perdido',
                  statusColor: Color(0xFF8B9D6F),
                ),
                SizedBox(height: 16),

                PetCard(
                  imageUrl:
                      'https://images.unsplash.com/photo-1560807707-8cc77767d783',
                  title: 'Cachorros en adopción responsable',
                  location: 'Caballito, CABA',
                  time: 'Hace 5 horas',
                  status: 'En Adopción',
                  statusColor: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B9D6F),
        onPressed: () {
          context.push('/create-pet');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  final String label;
  final Color color;
  const FilterSection({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff2d2d2d),
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String time;
  final String status;
  final Color statusColor;

  const PetCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.time,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/pet/123'); //agregar id
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: SizedBox(
                    height: 240,
                    width: double.infinity,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.pets,
                            size: 60,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Badge de estado (Perdido/En Adopción)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.search, color: Colors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Icono de bookmark
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      size: 20,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),

            // Información
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
