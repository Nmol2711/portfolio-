import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/responsive.dart'; // Tu helper responsivo

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
                _buildTextContent(context, isMobile: true),
                const SizedBox(height: 40),
                _buildAvatar(isMobile: true),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded obliga a la columna a respetar las 7 columnas de Figma
                Expanded(
                  flex: 8,
                  child: _buildTextContent(context, isMobile: false),
                ),
                const SizedBox(width: 40),
                // Lado derecho para tu foto / avatar
                Expanded(flex: 4, child: _buildAvatar(isMobile: false)),
              ],
            ),
    );
  }

  // Widget para los textos
  Widget _buildTextContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinea todo a la izquierda

      children: [
        // Subtítulo azul
        Text(
          'Hello my name is Nelson!',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: isMobile ? 18 : 32),
        ),
        const SizedBox(height: 32),

        // Título principal grande
        Text(
          'Mobile, Web & Backend Software Developer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: isMobile ? 32 : 40,
            height: 1.2,
          ),
        ),
        SizedBox(height: isMobile ? 18 : 64),

        // Párrafo descriptivo
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'I develop complete systems through design engineering and observation to understand real-life problems and transform them into high-quality digital solutions.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: isMobile ? 18 : 32),
          ),
        ),
        SizedBox(height: isMobile ? 32 : 128),
        // Botones de acción (Projects & Contacts)
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cardColor,
                foregroundColor: AppColors.titleColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Projects',
                style: TextStyle(
                  color: AppColors.titleColor,
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(width: isMobile ? 12 : 32),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.titleColor,
                side: const BorderSide(color: AppColors.textColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Contacts',
                style: TextStyle(
                  color: AppColors.titleColor,
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
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
            fit: BoxFit
                .cover, // Para que la foto llene el círculo proporcionalmente
          ),
        ),
      ),
    );
  }
}
