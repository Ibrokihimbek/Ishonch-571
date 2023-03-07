part of 'connectivity_cubit.dart';

@immutable
class ConnectivityState extends Equatable {
  ConnectivityState({required this.connectivityResult});

  final ConnectivityResult connectivityResult;

  ConnectivityState copyWith({ConnectivityResult? connectivityResult}) =>
      ConnectivityState(
          connectivityResult: connectivityResult ?? this.connectivityResult);

  @override
  List<Object?> get props => [connectivityResult];
}