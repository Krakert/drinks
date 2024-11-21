import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drinks/data/entity/add_location_req.dart';
import 'package:drinks/domain/usecase/add_new_location.dart';
import 'package:drinks/presentation/pages/maps/bloc/geolocator_bloc.dart';
import 'package:drinks/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _googleMapController;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 14.0,
  );

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  GeoPoint location = const GeoPoint(37.7749, -122.4194);

  Future _addMarkerLongPressed(LatLng latlang) async {
    setState(() {
      const MarkerId markerId = MarkerId("RANDOM_ID");
      Marker marker = Marker(
        markerId: markerId,
        draggable: true,
        position: latlang,
        infoWindow: const InfoWindow(
          title: "Marker here",
          snippet: 'This looks good',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers[markerId] = marker;
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeolocatorBloc()..add(LoadLocation()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps with Geolocator'),
        ),
        body: BlocConsumer<GeolocatorBloc, GeolocatorState>(
          listener: (context, state) {
            if (state is GeolocatorSuccess) {
              // Move the camera to the user's location once it is fetched
              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(
                        state.position.latitude, state.position.longitude),
                    zoom: 14.0,
                  ),
                ),
              );
            } else if (state is GeolocatorError) {
              // Handle location errors (e.g., permissions denied)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (controller) => _googleMapController = controller,
              onCameraMove: (cameraPosition) {
                location = GeoPoint(cameraPosition.target.latitude,
                    cameraPosition.target.longitude);

                debugPrint('📷 lat: ${cameraPosition.target.latitude}, '
                    'lng: ${cameraPosition.target.longitude}');
              },
              onLongPress: (latlang) => {_addMarkerLongPressed(latlang)},
              markers: Set<Marker>.of(markers.values), //all markers are here
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {
                  sl<AddNewLocationUseCase>().call(
                      params: AddLocationReq(
                          location: GeoFirePoint(location),
                          name: 'test',
                          drinks: [1, 2, 3]))
                }),
      ),
    );
  }
}
