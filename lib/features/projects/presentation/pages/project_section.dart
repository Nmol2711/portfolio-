import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/features/projects/presentation/widgets/card_custom_project.dart';
import 'package:portfolio/utils/responsive.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

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
            'Projects',
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
              children: const [
                CardCustomProject(
                  title: 'PDAM',
                  subTitle: 'Pet Food Dispenser Prototype',
                  description:
                      'This project is a comprehensive system designed to automate and monitor pet feeding. Developed as part of the Systems Engineering program at the Universidad Politécnica Territorial José Félix Ribas.',
                  link: 'https://github.com/Nmol2711/PDAM',
                  technologies: ['Python', 'Flutter', 'ESP32', 'FastAPI'],
                  assetImage: 'assets/imgs/pdam.png',
                ),
                CardCustomProject(
                  title: 'ZoroMee',
                  description:
                      'This software uses Artificial Intelligence to analyze the content of your documents and automatically organize them into thematic folders. Forget about moving files one by one.',
                  link: 'https://github.com/Nmol2711/ZoroMeme',
                  technologies: ['Python', 'Grop IA'],
                  assetImage: 'assets/imgs/zorromeme.png',
                ),
                CardCustomProject(
                  title: 'Yes No App',
                  description:
                      'A simple chat app built with Flutter that simulates a conversation. The app responds to questions and specific keywords with automated replies, including images and GIFs.',
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
