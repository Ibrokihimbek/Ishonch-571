import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  LocationPermissionCubit()
      : super(
          const LocationPermissionState(
            // latLongModel: LatLongModel(
            //   lat: 41.310699,
            //   long: 69.241656,
            // ),
            myPermissionStatus: MyPermissionStatus.Pure,
          ),
        );

  Location location = Location();
  LatLongModel? latLongModel;

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  Future<void> fetchCurrentLocation() async {
//1- qadam location qurilmada enable yoki disable ekanini tekshiradi
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

//2- qadam lakatsiyaga permission oladi
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // lakatsiyani oladi
    LocationData locationData = await location.getLocation();
    emit(state.copyWith(myPermissionStatus: MyPermissionStatus.Loading));
    // await Future.delayed(const Duration(seconds: 3));
    latLongModel = LatLongModel(
        lat: locationData.latitude!,
        long: locationData.longitude!,
        productId: 0);
    if (latLongModel != null) {
      emit(state.copyWith(
          myPermissionStatus: MyPermissionStatus.Success,
          latLongModel: latLongModel));
    } else {
      emit(state.copyWith(myPermissionStatus: MyPermissionStatus.Fail));
    }
  }

// listenCurrentLocation() {
//   location.onLocationChanged.listen((event) {
//     print("LOCATION CHANGED: ${event.longitude}, ${event.latitude}");
//   });
// }
}
