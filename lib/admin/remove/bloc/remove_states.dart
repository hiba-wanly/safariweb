abstract class RemoveState{}

class RemoveInitState  extends RemoveState {}

class RemoveLoadingState extends RemoveState {}

class RemoveLoadedState extends RemoveState {}

class LoadingErrorState extends RemoveState {
  final String message;
  LoadingErrorState({required this.message});
}