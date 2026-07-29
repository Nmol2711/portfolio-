import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/responsive.dart'; // Tu helper responsivo

class HeroSection extends StatelessWidget {
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactsTap;

  const HeroSection({super.key, this.onProjectsTap, this.onContactsTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    // Layout principal: Row en Desktop, Column en Mobile
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Textos principales (Saludo, Título y Descripción)
                _buildHeaderTexts(context, isMobile: true),
                const SizedBox(height: 32),

                // 2. Avatar de perfil
                _buildAvatar(isMobile: true),
                const SizedBox(height: 32),

                // 3. Botones de acción al final
                _buildActionButtons(context, isMobile: true),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderTexts(context, isMobile: false),
                      const SizedBox(height: 32),
                      _buildActionButtons(context, isMobile: false),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(flex: 4, child: _buildAvatar(isMobile: false)),
              ],
            ),
    );
  }

  // Widget para los textos (Saludo, Título y Descripción)
  Widget _buildHeaderTexts(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subtítulo azul
        Text(
          'Hello my name is Nelson!',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: isMobile ? 18 : 32),
        ),
        const SizedBox(height: 16),

        // Título principal grande
        Text(
          'Mobile, Web & Backend Software Developer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: isMobile ? 28 : 40,
            height: 1.2,
          ),
        ),
        SizedBox(height: isMobile ? 16 : 24),

        // Párrafo descriptivo
        Text(
          'I develop complete systems through design engineering and observation to understand real-life problems and transform them into high-quality digital solutions.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: isMobile ? 16 : 20,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // Widget para los botones de acción (Projects & Contacts)
  Widget _buildActionButtons(BuildContext context, {required bool isMobile}) {
    return Row(
      mainAxisAlignment: isMobile
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onProjectsTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.cardColor,
            foregroundColor: AppColors.titleColor,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 24,
              vertical: isMobile ? 12 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Projects',
            style: TextStyle(
              color: AppColors.titleColor,
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(width: isMobile ? 12 : 32),
        OutlinedButton(
          onPressed: onContactsTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.titleColor,
            side: const BorderSide(color: AppColors.textColor),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 24,
              vertical: isMobile ? 12 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Contacts',
            style: TextStyle(
              color: AppColors.titleColor,
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  // Círculo para tu foto de perfil
  Widget _buildAvatar({required bool isMobile}) {
    final double size = isMobile ? 200 : 280;

    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: AppColors.cardColor,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/imgs/nelson_mol.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
