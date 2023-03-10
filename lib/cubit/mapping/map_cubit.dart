import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/data/repositories/geocoding_repository.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.geocodingRepo})
      : super(const MapState(currentAddress: ""));

  final GeocodingRepo geocodingRepo;

  String addressText = "";

  void fetchAddress(
      {required LatLongModel latLongModel, required String kind}) async {
    addressText = await geocodingRepo.getAddress(latLongModel, kind);
    emit(state.copyWith(currentAddress: addressText));
  }
}
