abstract class AirLineState{}

class AirInitState  extends AirLineState {}

class AirLoading extends AirLineState {}

class AirLoadingSuccessState extends AirLineState {}

class AirLoadingErrorState extends AirLineState {
  final String message;
  AirLoadingErrorState({required this.message});
}