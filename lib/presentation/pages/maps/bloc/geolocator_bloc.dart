import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocator_event.dart';
part 'geolocator_state.dart';

class GeolocatorBloc extends Bloc<GeolocatorEvent, GeolocatorState> {
  GeolocatorBloc() : super(GeolocatorInitial()) {
    on<LoadLocation>((event, emit) async {
      emit(GeolocatorLoading());
      try {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          emit(const GeolocatorError('Location services are disabled.'));
          return;
        }

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(const GeolocatorError('Location permissions are denied.'));
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          emit(const GeolocatorError(
              'Location permissions are permanently denied.'));
          return;
        }

        // Platform-specific settings for Android and iOS/macOS
        LocationSettings locationSettings;
        if (defaultTargetPlatform == TargetPlatform.android) {
          locationSettings = AndroidSettings(
            accuracy: LocationAccuracy.high,
          );
        } else if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          locationSettings = AppleSettings(
            accuracy: LocationAccuracy.high,
          );
        } else {
          locationSettings = const LocationSettings(
            accuracy: LocationAccuracy.high,
          );
        }

        Position position = await Geolocator.getCurrentPosition(
            locationSettings: locationSettings);
        emit(GeolocatorSuccess(position));
      } catch (e) {
        emit(GeolocatorError('Failed to get location: ${e.toString()}'));
      }
    });
  }
}
