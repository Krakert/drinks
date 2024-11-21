import 'package:drinks/domain/models/location.dart';

abstract class LocationsState {}

class LocationsStateLoading extends LocationsState {}

class LocationsStateLoaded extends LocationsState {
  final List<Location> songs;
  LocationsStateLoaded({required this.songs});
}

class LocationsStateLoadFailure extends LocationsState {}