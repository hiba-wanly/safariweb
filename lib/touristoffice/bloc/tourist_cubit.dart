
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/restaurant/bloc/rest_states.dart';
import 'package:safariweb/touristoffice/bloc/tourist_states.dart';



class TourCubit extends Cubit<TourState>
{
  TourCubit(TourState initialState) : super(initialState);

  static TourCubit get(context) => BlocProvider.of(context);

}