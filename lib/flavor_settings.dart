enum FlavorEnvironment {
  development,
  staging,
  production;

  String get apiBaseUrl {
    return switch (this) {
      development => '',
      staging => '',
      production => '',
    };
  }
}

class FlavorSettings {
  FlavorSettings.development() : env = FlavorEnvironment.development;

  FlavorSettings.staging() : env = FlavorEnvironment.staging;

  FlavorSettings.production() : env = FlavorEnvironment.production;

  final FlavorEnvironment env;

  String get apiBaseUrl => env.apiBaseUrl;
}
