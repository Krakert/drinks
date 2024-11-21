import 'package:drinks/core/usecases/usecase.dart';
import 'package:drinks/data/entity/add_location_req.dart';
import 'package:drinks/domain/repository/location_repository.dart';
import 'package:drinks/service_locator.dart';

class AddNewLocationUseCase implements UseCase<bool, AddLocationReq> {
  @override
  Future<bool> call({AddLocationReq ? params}) async {
    return await sl<LocationRepository>().addNewLocation(params!);
  }
}
