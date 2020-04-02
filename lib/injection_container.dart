
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/requesthandling/data/datasources/request_local_data_source.dart';
import 'features/requesthandling/data/datasources/request_remote_data_source.dart';
import 'package:help_giver/features/requesthandling/data/repositories/requesthandling_repo.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/request_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/list_usecase.dart';
import 'package:help_giver/features/requesthandling/domain/usecases/listall_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/ask_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/takeon_usecase.dart';
// import 'package:help_giver/features/requesthandling/domain/usecases/delete_usecase.dart';
import 'features/requesthandling/presentation/bloc/request_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Bloc
sl.registerFactory(
  () => RequestBloc(
      userRepository: sl(),
      requestRepository: sl(),
  ),
);

//Use cases
sl.registerLazySingleton(() => NoRequests());
sl.registerLazySingleton(() => AllRequests(sl()));
sl.registerLazySingleton(() => MyRequests());
sl.registerLazySingleton(() => MakeRequest());
sl.registerLazySingleton(() => ListRequest(sl()));
sl.registerLazySingleton(() => ListAllRequest(sl()));
// sl.registerLazySingleton(() => AskRequest(sl()));
// sl.registerLazySingleton(() => DeleteRequest(sl()));
// sl.registerLazySingleton(() => TakeonRequest(sl()));

//Repo
sl.registerLazySingleton<RequestRepository>(
  () => RequestRepository(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ),
);
// Data sources
sl.registerLazySingleton<RequestRemoteDataSource>(
  () => RequestRemoteDataSourceImp(client: sl()),
);

sl.registerLazySingleton<RequestLocalSource>(
  () => RequestLocalDataSourceImpl(),//sharedPreferences: sl()),
);

//! Core
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

}