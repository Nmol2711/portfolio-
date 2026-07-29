import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/core/app_string.dart';
import 'package:portfolio/utils/responsive.dart';

class CustomNavbar extends StatelessWidget {
  final VoidCallback? onAboutTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onContactsTap;
  final VoidCallback? onMenuTap; // <-- Nuevo callback para el menú móvil
  final bool isEnglish;
  final VoidCallback onLanguageChanged;

  const CustomNavbar({
    super.key,
    this.onAboutTap,
    this.onProjectsTap,
    this.onSkillsTap,
    this.onContactsTap,
    this.onMenuTap,
    required this.isEnglish,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      decoration: BoxDecoration(color: AppColors.cardColor),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: Text(
              "Nelson Molina | Portfolio",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: isMobile ? 20 : 18),
            ),
          ),

          if (!isMobile)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _NavLink(
                    title: AppStrings.getText('nav_about', isEnglish),
                    onTap: onAboutTap ?? () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _NavLink(
                    title: AppStrings.getText('nav_projects', isEnglish),
                    onTap: onProjectsTap ?? () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _NavLink(
                    title: AppStrings.getText('nav_skills', isEnglish),
                    onTap: onSkillsTap ?? () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16.0,
                    bottom: 16.0,
                    right: 20.0,
                  ),
                  child: _NavLink(
                    title: AppStrings.getText('nav_contact', isEnglish),
                    onTap: onContactsTap ?? () {},
                  ),
                ),
                _BuilButtonLanguage(
                  onLanguageChanged: onLanguageChanged,
                  isEnglish: isEnglish,
                  isMobile: false,
                ),
              ],
            ),
          if (isMobile)
            Row(
              children: [
                _BuilButtonLanguage(
                  onLanguageChanged: onLanguageChanged,
                  isEnglish: isEnglish,
                  isMobile: true,
                ),
                IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
              ],
            ),
        ],
      ),
    );
  }
}

class _BuilButtonLanguage extends StatelessWidget {
  const _BuilButtonLanguage({
    required this.onLanguageChanged,
    required this.isEnglish,
    required this.isMobile,
  });

  final VoidCallback onLanguageChanged;
  final bool isEnglish;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: onLanguageChanged,
        label: Text(
          isEnglish ? 'ES' : 'EN',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontSize: isMobile ? 18 : 20),
        ),
        icon: Icon(Icons.language),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => __NavLinkState();
}

class __NavLinkState extends State<_NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        isHovered = true;
      }),
      onExit: (_) => setState(() {
        isHovered = false;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isHovered ? AppColors.accentColor : AppColors.textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
