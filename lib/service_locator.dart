import 'package:drinks/data/repository/drinks_repository_impl.dart';
import 'package:drinks/data/repository/locations_repository_impl.dart';
import 'package:drinks/data/source/drinks_firebase_service.dart';
import 'package:drinks/data/source/location_firebase_service.dart';
import 'package:drinks/domain/repository/drinks_repository.dart';
import 'package:drinks/domain/repository/location_repository.dart';
import 'package:drinks/domain/usecase/add_new_location.dart';
import 'package:drinks/domain/usecase/get_list_locations.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Data
  sl.registerSingleton<DrinksFirebaseService>(DrinksFirebaseServiceImpl());
  sl.registerSingleton<LocationFirebaseService>(LocationFirebaseServiceImpl());

  sl.registerSingleton<DrinkRepository>(DrinksRepositoryImpl());
  sl.registerSingleton<LocationRepository>(LocationsRepositoryImpl());

  // Domain
  sl.registerLazySingleton(() => GetListLocationsUseCase());
  sl.registerLazySingleton(() => AddNewLocationUseCase());
}
