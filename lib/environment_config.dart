import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  // We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final movieApiKey =
      const String.fromEnvironment("1b7379446c64c65ef9206621be4e08e3");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
