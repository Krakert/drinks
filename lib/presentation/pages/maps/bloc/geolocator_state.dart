part of 'geolocator_bloc.dart';

abstract class GeolocatorState extends Equatable {
  const GeolocatorState();

  @override
  List<Object> get props => [];
}

class GeolocatorInitial extends GeolocatorState {}

class GeolocatorLoading extends GeolocatorState {}

class GeolocatorSuccess extends GeolocatorState {
  final Position position;

  const GeolocatorSuccess(this.position);

  @override
  List<Object> get props => [position];
}

class GeolocatorError extends GeolocatorState {
  final String message;

  const GeolocatorError(this.message);

  @override
  List<Object> get props => [message];
}
