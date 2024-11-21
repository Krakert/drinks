import 'package:either_dart/either.dart';

abstract class DrinksFirebaseService {
  Future<Either> getDrinksOfType(String type);
}


class DrinksFirebaseServiceImpl extends DrinksFirebaseService {

  @override
  Future<Either> getDrinksOfType(String type) async {
    // TODO: implement getDrinksOfType
    throw UnimplementedError();
  }


}