import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/open_url.dart';

class CardCustomProject extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String description;
  final String link;
  final String assetImage;
  final List<String> technologies;

  const CardCustomProject({
    super.key,
    required this.title,
    this.subTitle,
    required this.description,
    required this.link,
    this.technologies = const [],
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Si el contenedor padre es ancho (> 1000px), cada tarjeta ocupa cerca de la mitad (50%)
        // Si no, ocupa el 100% del ancho disponible.
        final double cardWidth = constraints.maxWidth > 1000
            ? (constraints.maxWidth / 2) - 16
            : constraints.maxWidth;

        return Container(
          width: cardWidth,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Imagen / Preview arriba para formato Grid
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  assetImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit
                      .cover, // O BoxFit.contain si no quieres que se recorte nada
                ),
              ),
              const SizedBox(height: 16),

              // 2. Título y Subtítulo
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: 24),
              ),
              if (subTitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subTitle!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppColors.textColor),
                ),
              ],
              const SizedBox(height: 12),

              // 3. Descripción
              Text(description, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 16),

              // 4. Tecnologías y Botón GitHub en la parte inferior
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (technologies.isNotEmpty)
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.labelMedium,
                          children: [
                            const TextSpan(
                              text: 'Technologies: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: technologies.join(', ')),
                          ],
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: link.isNotEmpty
                          ? () async => await openUrl(link)
                          : null,

                      icon: SvgPicture.asset(
                        'assets/icons/github.svg',
                        width: 25, // Tamaño adecuado para un botón
                        height: 25,

                        // Descomenta la siguiente línea si tu PNG es negro y necesitas que sea blanco:
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      label: const Text('GitHub'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF21262D),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
