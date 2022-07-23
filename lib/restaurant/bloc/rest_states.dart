abstract class RestState{}

class RestInitState  extends RestState {}

class RestLoading extends RestState {}

class RestLoadingSuccessState extends RestState {}

class RestLoadingErrorState extends RestState {
  final String message;
  RestLoadingErrorState({required this.message});
}