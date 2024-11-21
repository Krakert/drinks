import 'package:drinks/presentation/pages/home/bloc/locations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationsCubit()..getListLocations(),
      child: const Column(),
    );
  }
}
