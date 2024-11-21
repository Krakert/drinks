import 'package:drinks/domain/usecase/get_list_locations.dart';
import 'package:drinks/presentation/pages/home/bloc/locations_state.dart';
import 'package:drinks/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsStateLoading());

  Future<void> getListLocations() async {
    var returnedSongs = await sl<GetListLocationsUseCase>().call();
    returnedSongs.fold((l) {
      emit(LocationsStateLoadFailure());
    }, (data) {
      emit(LocationsStateLoaded(songs: data));
    });
  }
}
