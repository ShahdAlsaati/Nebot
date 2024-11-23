import 'package:get_it/get_it.dart';
import 'package:nebot/data/datasources/auth_local_service.dart';
import 'package:nebot/data/repositories/auth.dart';
import 'package:nebot/domain/repositories/auth.dart';
import 'package:nebot/domain/usecases/get_countries.dart';
import 'package:nebot/domain/usecases/is_logged_in.dart';
import 'package:nebot/domain/usecases/sign_up.dart';

import 'core/network/dio_client.dart';
import 'data/datasources/auth_api_service.dart';
import 'domain/usecases/login.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(
      AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  sl.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );
  sl.registerSingleton<AuthLocalService>(
      AuthLocalServiceImpl()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );
  sl.registerSingleton<GetCountriesUseCase>(
      GetCountriesUseCase()
  );
  sl.registerSingleton<LoginUseCase>(
      LoginUseCase()
  );
}