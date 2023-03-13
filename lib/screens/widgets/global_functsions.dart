import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../cubit/mapping/map_cubit.dart';
import '../../data/models/helper/lat_long_model.dart';
import '../product_detail/sub_screens/check_out/check_out_screen.dart';

getLocationPermission(BuildContext context, int productId) async {
  Location location = Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locationData = await location.getLocation();
  if (locationData.latitude != null) {
    if (context.mounted) return;
    BlocProvider.of<MapCubit>(context).fetchAddress(
      latLongModel: LatLongModel(
        lat: locationData.latitude ?? 0.0,
        long: locationData.longitude ?? 0.0,
      ),
      kind: "house",
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckOutScreen(
          latLong: LatLongModel(
            lat: locationData.latitude ?? 0.0,
            long: locationData.longitude ?? 0.0,
            productId: productId,
          ),
        ),
      ),
    );
  }
  print("LONGITUDE:${locationData.longitude} AND ${locationData.latitude}");
}
