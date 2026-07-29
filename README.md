# portfolio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# 🚀 Nelson Molina - Personal Portfolio

¡Bienvenido a mi portafolio profesional web! Esta plataforma está desarrollada con **Flutter Web**, diseñada con una arquitectura limpia, soporte responsive (Desktop & Mobile) y un enfoque en alta performance para mostrar mis proyectos, stack tecnológico y vías de contacto.

🌐 **Demo en vivo:** [https://tu-usuario.github.io/tu-repo/](https://tu-usuario.github.io/tu-repo/)

---

## 🛠️ Tech Stack & Arquitectura

* **Frontend:** Flutter Web (Dart)
* **State Management & Patterns:** BLoC / Clean Architecture
* **UI/UX:** Responsive Layouts, Dynamic Navigation & Smooth Scrolling (`Scrollable.ensureVisible`)
* **Deployment:** GitHub Pages / Actions (CI/CD)

---

## 📂 Estructura del Proyecto

```text
lib/
├── core/            # Configuración global de temas, colores y constantes
├── utils/           # Clases auxiliares para responsive design y manejo de URLs
└── features/        # Módulos organizados por funcionalidad
    ├── hero/        # Presentación principal
    ├── projects/    # Módulo de proyectos y tarjetas destacadas
    ├── skills/      # Categorías técnicas (Languages, Frameworks, Tools)
    ├── contacts/    # Formulario / Botones de contacto y footer
    └── home/        # Estructura general de navegación y CustomNavbar