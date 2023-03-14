part of 'map_cubit.dart';

class MapState extends Equatable {
  final String currentAddress;
  final LatLongModel latLongModel;

  const MapState({
    required this.latLongModel,
    required this.currentAddress,
  });

  MapState copyWith({
    String? currentAddress,
    LatLongModel? latLongModel,
  }) =>
      MapState(
        latLongModel: latLongModel ?? this.latLongModel,
        currentAddress: currentAddress ?? this.currentAddress,
      );

  @override
  List<Object?> get props => [
    currentAddress,
    latLongModel,
  ];
}
