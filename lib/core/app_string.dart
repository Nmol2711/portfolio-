class AppStrings {
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'greeting': 'Hello my name is Nelson!',
      'role': 'Mobile, Web & Backend Software Developer',
      'description':
          'I develop complete systems through design engineering and observation to understand real-life problems and transform them into high-quality digital solutions.',
      'btn_projects': 'Projects',
      'btn_contacts': 'Contacts',
      'nav_about': 'About',
      'nav_skills': 'Skills',
      'nav_projects': 'Projects',
      'nav_contact': 'Contact',
      'contact_dialogue':
          'Im currently open to new opportunities, freelance projects, or collaborations.',
      'project_pdam_title': 'PDAM',
      'project_pdam_subtitle': 'Pet Food Dispenser Prototype',
      'project_pdam_description':
          'This project is a comprehensive system designed to automate and monitor pet feeding. Developed as part of the Systems Engineering program at the Universidad Politécnica Territorial José Félix Ribas.',
      'project_zoromee_title': 'ZoroMee',
      'project_zoromee_description':
          'This software uses Artificial Intelligence to analyze the content of your documents and automatically organize them into thematic folders. Forget about moving files one by one.',
      'project_yesno_title': 'Yes No App',
      'project_yesno_description':
          'A simple chat app built with Flutter that simulates a conversation. The app responds to questions and specific keywords with automated replies, including images and GIFs.',
    },
    'es': {
      'greeting': '¡Hola, mi nombre es Nelson!',
      'role': 'Desarrollador de Software Mobile, Web & Backend',
      'description':
          'Desarrollo sistemas completos a través de la ingeniería de diseño y la observación para comprender problemas de la vida real y transformarlos en soluciones digitales de alta calidad.',
      'btn_projects': 'Proyectos',
      'btn_contacts': 'Contactos',
      'nav_about': 'Sobre mí',
      'nav_skills': 'Habilidades',
      'nav_projects': 'Proyectos',
      'nav_contact': 'Contacto',
      'contact_dialogue':
          'Actualmente estoy abierto a nuevas oportunidades, proyectos freelance o colaboraciones.',
      'project_pdam_title': 'PDAM',
      'project_pdam_subtitle':
          'Prototipo de Dispensador de Comida para Mascotas',
      'project_pdam_description':
          'Este proyecto es un sistema integral diseñado para automatizar y monitorear la alimentación de mascotas. Desarrollado como parte del programa de Ingeniería de Sistemas de la Universidad Politécnica Territorial José Félix Ribas.',
      'project_zoromee_title': 'ZoroMee',
      'project_zoromee_description':
          'Este software utiliza Inteligencia Artificial para analizar el contenido de tus documentos y organizarlos automáticamente en carpetas temáticas. Olvídate de mover archivos uno por uno.',
      'project_yesno_title': 'Yes No App',
      'project_yesno_description':
          'Una aplicación de chat simple construida con Flutter que simula una conversación. La app responde a preguntas y palabras clave específicas con respuestas automáticas, incluyendo imágenes y GIFs.',
    },
  };

  // Método para obtener el texto según si es inglés o no
  static String getText(String key, bool isEnglish) {
    final lang = isEnglish ? 'en' : 'es';
    return _localizedValues[lang]?[key] ?? key;
  }
}
