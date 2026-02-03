enum Environment { dev, prod }

class AppConfig {
  static late Environment environment;
  static late String apiUrl;

  static void initialize({
    required Environment environment,
    required String apiUrl,
  }) {
    AppConfig.environment = environment;
    AppConfig.apiUrl = apiUrl;
  }

  static bool get isDev => environment == Environment.dev;
  static bool get isProd => environment == Environment.prod;
}
