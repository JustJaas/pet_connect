import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PetDetailPage extends StatefulWidget {
  final String petId;
  const PetDetailPage({super.key, required this.petId});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  int currentImageIndex = 0;
  bool isFavorite = false;

  final List<String> images = [
    'https://images.unsplash.com/photo-1587300003388-59208cc962cb',
    'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e',
    'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal con scroll
          CustomScrollView(
            slivers: [
              // Carrusel de imágenes
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.pets, size: 100),
                              );
                            },
                          );
                        },
                      ),

                      // Gradiente en la parte superior
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Indicadores de página
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentImageIndex == index
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Contenido
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nombre
                        const Text(
                          'Pipo',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Ubicación
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Madrid, España',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Chips de estado
                        const Wrap(
                          spacing: 8,
                          children: [
                            _InfoChip(label: 'En Adopción'),
                            _InfoChip(label: 'Macho'),
                            _InfoChip(label: 'Vacunado'),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Cards de información
                        const Row(
                          children: [
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.cake_outlined,
                                value: '2 años',
                                label: 'Edad',
                                color: Color(0xFFFF8A5C),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.pets,
                                value: 'Mixta',
                                label: 'Raza',
                                color: Color(0xFFFF8A5C),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: _InfoCard(
                                icon: Icons.straighten,
                                value: 'Mediano',
                                label: 'Tamaño',
                                color: Color(0xFFFF8A5C),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Sobre Pipo
                        const Text(
                          'Sobre Pipo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'Pipo es un perro increíblemente cariñoso y juguetón. Le encanta correr al aire libre y jugar a buscar la pelota. Es muy inteligente y aprende rápido. Se lleva bien con otros perros y es genial con los niños. Busca un hogar para siempre donde pueda recibir mucho amor y atención.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Responsable
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F0),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ana García',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2D2D2D),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Responsable de Adopción',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 100), // Espacio para los botones
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Botones superiores (Back y Favorito)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón atrás
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                ),

                // Botón favorito
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Botones inferiores (Compartir y Contactar)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Compartir
                      },
                      icon: const Icon(Icons.share, color: Color(0xFFFF8A5C)),
                      label: const Text(
                        'Compartir',
                        style: TextStyle(color: Color(0xFFFF8A5C)),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFFFF8A5C)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Contactar
                      },
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Contactar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8A5C),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para los chips de información
class _InfoChip extends StatelessWidget {
  final String label;

  const _InfoChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Color(0xFF2D2D2D)),
      ),
    );
  }
}

// Widget para las cards de información
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
