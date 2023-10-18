import 'package:flutter/services.dart';
import 'package:flutter_project_base/flavor_settings.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FlavorModule {
  @preResolve
  Future<FlavorSettings> flavorSettings() async {
    final String? flavor =
    await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
    if (flavor == 'development') {
      return FlavorSettings.development();
    } else if (flavor == 'staging') {
      return FlavorSettings.staging();
    } else if (flavor == 'production') {
      return FlavorSettings.production();
    } else {
      throw Exception('Unknown flavor: $flavor');
    }
  }
}