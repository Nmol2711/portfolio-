import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String urlString) async {
  if (urlString.isEmpty) return;

  final Uri url = Uri.parse(urlString);

  // mode: LaunchMode.externalApplication abre el enlace en una pestaña nueva en la Web
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $urlString');
  }
}