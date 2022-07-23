abstract class PlacesState{}

class PlacesInitState  extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoadingSuccessState extends PlacesState {}

class PlacesLoadingErrorState extends PlacesState {
  final String message;
  PlacesLoadingErrorState({required this.message});
}