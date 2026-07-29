import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/open_url.dart';
import 'package:portfolio/utils/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        // 1. Encabezado de la Sección
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: AppColors.cardColor,
          alignment: Alignment.center,
          child: Text(
            'Get In Touch',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
        ),

        const SizedBox(height: 40),

        // 2. Contenido de Contacto
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                Text(
                  "I'm currently open to new opportunities, freelance projects, or collaborations.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile ? 16 : 18,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Botones / Badges de Contacto
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    // Email
                    _buildContactButton(
                      context,
                      label: 'Send Email',
                      icon: Icons.email_outlined,
                      onTap: () => openUrl(
                        'mailto:molinacmacho581@gmail.com',
                      ), // Sustituye tu correo real
                    ),
                    // GitHub
                    _buildContactButton(
                      context,
                      label: 'GitHub',
                      svgIcon: 'assets/icons/github.svg',
                      onTap: () => openUrl('https://github.com/Nmol2711'),
                    ),
                    // LinkedIn (Si usas icono SVG o Icon nativo)
                    _buildContactButton(
                      context,
                      label: 'LinkedIn',
                      icon: Icons.link_rounded,
                      onTap: () => openUrl(
                        'https://www.linkedin.com/in/nelson-alberto-37a819252/',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 80),

        // 3. Footer / Copyright
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.cardColor,
          child: Column(
            children: [
              Text(
                'Designed & Built by Nelson Molina',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Built with Flutter Web',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textColor.withValues(alpha: 0.6),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactButton(
    BuildContext context, {
    required String label,
    IconData? icon,
    String? svgIcon,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: svgIcon != null
          ? SvgPicture.asset(
              svgIcon,
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )
          : Icon(icon, size: 18, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF21262D),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
