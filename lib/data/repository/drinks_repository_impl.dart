import 'package:drinks/domain/repository/drinks_repository.dart';
import 'package:either_dart/src/either.dart';

class DrinksRepositoryImpl extends DrinkRepository {
  @override
  Future<Either> getDrinksOfType(String type) {
    throw UnimplementedError();
  }
}
