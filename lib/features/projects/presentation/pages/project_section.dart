import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/core/app_string.dart';
import 'package:portfolio/features/projects/presentation/widgets/card_custom_project.dart';
import 'package:portfolio/utils/responsive.dart';

class ProjectSection extends StatelessWidget {
  final bool isEnglish;
  const ProjectSection({super.key, this.isEnglish = true});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        // Encabezado
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: AppColors.cardColor,
          alignment: Alignment.center,
          child: Text(
            AppStrings.getText('nav_projects', isEnglish),
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
        ),

        const SizedBox(height: 32),

        // Contenedor principal con límite de ancho para Ultra-Wide
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1400,
            ), // Ampliamos a 1400px para dar espacio a 2 columnas
            child: Wrap(
              spacing: 24, // Espacio horizontal entre tarjetas
              runSpacing: 24, // Espacio vertical entre filas
              alignment: WrapAlignment.center,
              children: [
                CardCustomProject(
                  title: AppStrings.getText('project_pdam_title', isEnglish),
                  subTitle: AppStrings.getText(
                    'project_pdam_subtitle',
                    isEnglish,
                  ),
                  description: AppStrings.getText(
                    'project_pdam_description',
                    isEnglish,
                  ),
                  link: 'https://github.com/Nmol2711/PDAM',
                  technologies: ['Python', 'Flutter', 'ESP32', 'FastAPI'],
                  assetImage: 'assets/imgs/pdam.png',
                ),
                CardCustomProject(
                  title: AppStrings.getText('project_zoromee_title', isEnglish),
                  description: AppStrings.getText(
                    'project_zoromee_description',
                    isEnglish,
                  ),
                  link: 'https://github.com/Nmol2711/ZoroMeme',
                  technologies: ['Python', 'Grop IA'],
                  assetImage: 'assets/imgs/zorromeme.png',
                ),
                CardCustomProject(
                  title: AppStrings.getText('project_yesno_title', isEnglish),
                  description: AppStrings.getText(
                    'project_yesno_description',
                    isEnglish,
                  ),
                  link: 'https://github.com/Nmol2711/Flutter-Chat-Yes-No',
                  technologies: ['Flutter'],
                  assetImage: 'assets/imgs/yesnoapp.png',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
