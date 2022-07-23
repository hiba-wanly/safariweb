abstract class AddState{}

class AddInitState  extends AddState {}

class AddLoadingState extends AddState {}

class AddLoadedState extends AddState {}

class LoadingErrorState extends AddState {
  final String message;
  LoadingErrorState({required this.message});
}