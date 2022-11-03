import 'dart:developer';

import 'package:url_launcher/url_launcher.dart' as launcher;

import '../services/crash_report/logger.dart';

class UrlLauncher {
  static Future<void> launch(String url) async {
    try {
      Logger logger = Logger.instance;

      try {
        await launcher.launchUrl(Uri.parse(url));
        logger.info(module: UrlLauncher, message: 'URL $url launched');
      } catch (err) {
        logger.error(
          module: UrlLauncher,
          message: 'Unable to launch url $url, error: $err',
        );
      }
    } catch (error) {
      log('Error launching url: $error');
    }
  }
}
