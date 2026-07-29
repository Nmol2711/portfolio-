import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/utils/responsive.dart';

class CustomNavbar extends StatelessWidget {
  final VoidCallback? onAboutTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onContactsTap;
  final VoidCallback? onMenuTap; // <-- Nuevo callback para el menú móvil

  const CustomNavbar({
    super.key,
    this.onAboutTap,
    this.onProjectsTap,
    this.onSkillsTap,
    this.onContactsTap,
    this.onMenuTap, // <-- Lo requerimos de forma opcional
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
              left: 32.0,
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: Text(
              "Nelson Molina | Portfolio",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 24),
            ),
          ),
          if (!isMobile)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _NavLink(
                    title: 'About me',
                    onTap: onAboutTap ?? () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _NavLink(
                    title: 'Projects',
                    onTap: onProjectsTap ?? () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _NavLink(title: 'Skills', onTap: onSkillsTap ?? () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    bottom: 16.0,
                    right: 32.0,
                  ),
                  child: _NavLink(
                    title: 'Contacts',
                    onTap: onContactsTap ?? () {},
                  ),
                ),
              ],
            ),
          if (isMobile)
            IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
        ],
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
