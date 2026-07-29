import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  final bool isEnglish;
  const SkillsSection({super.key, this.isEnglish = true});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    // Mapeo exacto respetando los nombres de tus archivos en assets/icons/
    final List<Map<String, dynamic>> skillCategories = [
      {
        'category': 'Languages & Libraries',
        'items': [
          {
            'name': 'Python',
            'icon': 'assets/icons/python.svg',
            'details': 'SQLAlchemy, SQLModel, Pydantic, Beanie',
          },
          {
            'name': 'Dart',
            'icon': 'assets/icons/dart.svg',
            'details': 'BLoC Pattern, Clean Architecture',
          },
          {
            'name': 'SQL',
            'icon': 'assets/icons/database.svg',
            'details': 'SQLite, PostgreSQL',
          },
        ],
      },
      {
        'category': 'Frameworks',
        'items': [
          {
            'name': 'FastAPI',
            'icon': 'assets/icons/FastAPI.svg', // Con mayúscula inicial
            'details': 'RESTful APIs, Async Backend',
          },
          {
            'name': 'Flutter',
            'icon': 'assets/icons/flutter.svg',
            'details': 'Mobile, Web & Desktop Apps',
          },
        ],
      },
      {
        'category': 'Tools & Infrastructure',
        'items': [
          {
            'name': 'Docker',
            'icon': 'assets/icons/Docker.svg', // Con mayúscula inicial
            'details': 'Containerization & Environments',
          },
          {
            'name': 'Git & GitHub',
            'icon': 'assets/icons/Git.svg', // Con mayúscula inicial
            'details': 'Version Control, Actions & Workflows',
          },
          {
            'name': 'Linux',
            'icon': 'assets/icons/Linux.svg', // Con mayúscula inicial
            'details': 'Fedora, Mint, Shell Scripting',
          },
        ],
      },
    ];

    return Column(
      children: [
        // Encabezado
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: AppColors.cardColor,
          alignment: Alignment.center,
          child: Text(
            isEnglish ? 'Skills & Technologies' : 'Habilidades & Tecnologías',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
        ),

        const SizedBox(height: 32),

        // Grid Responsivo
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: skillCategories.map((cat) {
                return _buildCategoryCard(
                  context,
                  title: cat['category'] as String,
                  items: cat['items'] as List<Map<String, String>>,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required List<Map<String, String>> items,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = constraints.maxWidth > 900
            ? (constraints.maxWidth / 3) - 18
            : constraints.maxWidth;

        return Container(
          width: cardWidth,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.textColor.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la Categoría
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleColor,
                ),
              ),
              const SizedBox(height: 20),

              // Lista de Items
              ...items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge con Icono + Nombre
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF21262D),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              item['icon']!,
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['name']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Librerías o detalles
                      Text(
                        item['details']!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textColor,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
