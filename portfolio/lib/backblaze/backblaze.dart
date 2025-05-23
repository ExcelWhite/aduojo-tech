import 'package:url_launcher/url_launcher.dart';

class BackblazeService {
  static const String _baseUrl = 'https://f005.backblazeb2.com/file/aduojo-resume';

  static Future<void> downloadResumeEnglish() async {
    final url = Uri.parse('$_baseUrl/resume_eng.pdf');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> downloadResumeRussian() async {
    final url = Uri.parse('$_baseUrl/resume_rus.pdf');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}