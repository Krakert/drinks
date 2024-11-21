import 'package:either_dart/either.dart';

abstract class DrinkRepository {

  Future<Either> getDrinksOfType(String type);
  
}
