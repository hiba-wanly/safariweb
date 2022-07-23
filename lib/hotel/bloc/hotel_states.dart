abstract class HotelState{}

class HotelInitState  extends HotelState {}

class HotelLoading extends HotelState {}

class HotelLoadingSuccessState extends HotelState {}

class HotelLoadingErrorState extends HotelState {
  final String message;
  HotelLoadingErrorState({required this.message});
}