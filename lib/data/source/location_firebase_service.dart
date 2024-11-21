import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drinks/data/entity/add_location_req.dart';
import 'package:either_dart/either.dart';

abstract class LocationFirebaseService {
  Future<Either> getListLocations();
  Future<bool> addNewLocation(AddLocationReq data);
}

class LocationFirebaseServiceImpl extends LocationFirebaseService {
  @override
  Future<Either> getListLocations() {
    // TODO: implement getListLocations
    throw UnimplementedError();
  }

  @override
  Future<bool> addNewLocation(AddLocationReq data) async {
    try {
      FirebaseFirestore.instance.collection('locations').add(
        <String, dynamic>{
          'geo': data.location.data,
          'name': data.name,
          'isVisible': false,
          'drinks' : data.drinks
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
