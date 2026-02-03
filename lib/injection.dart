import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();

  // Aquí puedes registrar dependencias manualmente si lo necesitas
  // getIt.registerSingleton<Dio>(
  //   Dio(BaseOptions(baseUrl: AppConfig.apiUrl))
  // );
}
