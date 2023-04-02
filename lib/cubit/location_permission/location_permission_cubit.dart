import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:location/location.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit()
      : super(
          const LocationPermissionState(
            myPermissionStatus: MyPermissionStatus.pure,
          ),
        );

  Location location = Location();
  LatLongModel? latLongModel;

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> fetchCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    emit(state.copyWith(myPermissionStatus: MyPermissionStatus.loading));
    LocationData locationData = await location.getLocation();
    // await Future.delayed(const Duration(seconds: 3));
    latLongModel = LatLongModel(
      lat: locationData.latitude!,
      long: locationData.longitude!,
    );
    if (latLongModel != null) {
      emit(state.copyWith(
          myPermissionStatus: MyPermissionStatus.success,
          latLongModel: latLongModel));
    } else {
      emit(state.copyWith(myPermissionStatus: MyPermissionStatus.fail));
    }
  }
}
