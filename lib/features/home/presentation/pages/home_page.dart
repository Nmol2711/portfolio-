import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';
import 'package:portfolio/core/app_string.dart';
import 'package:portfolio/features/hero/presentation/pages/contact_section.dart';
import 'package:portfolio/features/hero/presentation/pages/hero_page.dart';
import 'package:portfolio/features/home/presentation/widgets/buil_drawer_item.dart';
import 'package:portfolio/features/home/presentation/widgets/custom_navbar.dart';
import 'package:portfolio/features/projects/presentation/pages/project_section.dart';
import 'package:portfolio/features/skills/presentation/pages/skills_section.dart';
import 'package:portfolio/utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isEnglish = false;

  final ScrollController _scrollController = ScrollController();

  // Clave para controlar el Scaffold (abrir/cerrar el Drawer en móvil)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Claves globales para identificar la posición de cada sección
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactsKey = GlobalKey();

  void toggleLanguage() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  // Función para desplazarse suavemente a una sección
  void _scrollToSection(GlobalKey key) {
    // Cierra el endDrawer si está abierto
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      _scaffoldKey.currentState?.closeEndDrawer();
    }

    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Asignamos la clave al Scaffold
      // Creamos el menú lateral (Drawer) que aparecerá en dispositivos móvile
      endDrawer: Drawer(
        backgroundColor: AppColors.cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Navigation',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () =>
                          _scaffoldKey.currentState?.closeEndDrawer(),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white12, height: 1),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    buildDrawerItem(
                      context,
                      title: AppStrings.getText('nav_about', isEnglish),
                      icon: Icons.person_outline_rounded,
                      onTap: () => _scrollToSection(_heroKey),
                    ),
                    buildDrawerItem(
                      context,
                      title: AppStrings.getText('nav_projects', isEnglish),
                      icon: Icons.code_rounded,
                      onTap: () => _scrollToSection(_projectsKey),
                    ),
                    buildDrawerItem(
                      context,
                      title: AppStrings.getText('nav_skills', isEnglish),
                      icon: Icons.terminal_rounded,
                      onTap: () => _scrollToSection(_skillsKey),
                    ),
                    buildDrawerItem(
                      context,
                      title: AppStrings.getText('nav_contact', isEnglish),
                      icon: Icons.alternate_email_rounded,
                      onTap: () => _scrollToSection(_contactsKey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          CustomNavbar(
            onAboutTap: () => _scrollToSection(_heroKey),
            onProjectsTap: () => _scrollToSection(_projectsKey),
            onSkillsTap: () => _scrollToSection(_skillsKey),
            onContactsTap: () => _scrollToSection(_contactsKey),
            // Callback para abrir el Drawer cuando se presiona el menú hamburguesa en móvil
            onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),

            isEnglish: isEnglish,
            onLanguageChanged: toggleLanguage,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  if (!Responsive.isMobile(context)) const SizedBox(height: 40),
                  HeroSection(
                    key: _heroKey,
                    onProjectsTap: () => _scrollToSection(_projectsKey),
                    onContactsTap: () => _scrollToSection(_contactsKey),
                    isEnglish: isEnglish,
                  ),
                  const SizedBox(height: 60),

                  ProjectSection(key: _projectsKey, isEnglish: isEnglish),
                  const SizedBox(height: 60),

                  SkillsSection(key: _skillsKey, isEnglish: isEnglish),
                  const SizedBox(height: 60),

                  ContactSection(key: _contactsKey, isEnglish: isEnglish),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
