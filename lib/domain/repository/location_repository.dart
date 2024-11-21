import 'package:drinks/data/entity/add_location_req.dart';
import 'package:either_dart/either.dart';

abstract class LocationRepository {
  Future<Either> getListLocations(String type);

  Future<bool> addNewLocation(AddLocationReq location);
}
