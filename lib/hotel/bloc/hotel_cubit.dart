
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/hotel/bloc/hotel_states.dart';



class HotelCubit extends Cubit<HotelState>
{
  HotelCubit(HotelState initialState) : super(initialState);

  static HotelCubit get(context) => BlocProvider.of(context);

}