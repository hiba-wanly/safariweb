abstract class TourState{}

class TourInitState  extends TourState {}

class TourLoading extends TourState {}

class TourLoadingSuccessState extends TourState {}

class TourLoadingErrorState extends TourState {
  final String message;
  TourLoadingErrorState({required this.message});
}