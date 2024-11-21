import 'package:drinks/data/entity/add_location_req.dart';
import 'package:drinks/data/source/location_firebase_service.dart';
import 'package:drinks/domain/repository/location_repository.dart';
import 'package:drinks/service_locator.dart';
import 'package:either_dart/src/either.dart';

class LocationsRepositoryImpl extends LocationRepository {
  
  @override
  Future<Either> getListLocations(String type) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addNewLocation(AddLocationReq location) async {
    return await sl<LocationFirebaseService>().addNewLocation(location);  
  }
  
}