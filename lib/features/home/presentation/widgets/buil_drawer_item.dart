import 'package:flutter/material.dart';
import 'package:portfolio/core/app_colors.dart';

Widget buildDrawerItem(
  BuildContext context, {
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: ListTile(
      leading: Icon(icon, color: AppColors.accentColor, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: onTap,
      hoverColor: AppColors.accentColor.withValues(alpha: 0.1),
    ),
  );
}
