abstract class CarState{}

class CarInitState  extends CarState {}

class CarLoading extends CarState {}

class CarLoadingSuccessState extends CarState {}

class CarLoadingErrorState extends CarState {
  final String message;
  CarLoadingErrorState({required this.message});
}