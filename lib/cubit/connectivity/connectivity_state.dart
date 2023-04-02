part of 'connectivity_cubit.dart';


class ConnectivityState extends Equatable {
  const ConnectivityState({required this.connectivityResult});

  final ConnectivityResult connectivityResult;

  ConnectivityState copyWith({ConnectivityResult? connectivityResult}) =>
      ConnectivityState(
          connectivityResult: connectivityResult ?? this.connectivityResult);

  @override
  List<Object?> get props => [connectivityResult];
}