import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/data/repositories/geocoding_repository.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.geocodingRepo})
      : super(
          MapState(
            currentAddress: "",
            latLongModel: LatLongModel(
              lat: 41.310699,
              long: 69.241656,
            ),
          ),
        );

  final GeocodingRepo geocodingRepo;

  String addressText = "";
  LatLongModel? latLongModel;

  void fetchAddress(
      {required LatLongModel latLongModel, required String kind}) async {
    addressText = await geocodingRepo.getAddress(latLongModel, kind);
    emit(state.copyWith(currentAddress: addressText, latLongModel: latLongModel));
  }
}
