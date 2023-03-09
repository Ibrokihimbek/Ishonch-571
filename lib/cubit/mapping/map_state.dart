part of 'map_cubit.dart';

class MapState extends Equatable {
  final String currentAddress;

  const MapState({
    required this.currentAddress,
  });

  MapState copyWith({
    String? currentAddress,
  }) =>
      MapState(
        currentAddress: currentAddress ?? this.currentAddress,
      );

  @override
  List<Object?> get props => [
    currentAddress,
  ];
}
