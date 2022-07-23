
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/airlines/bloc/airline_states.dart';



class AirLineCubit extends Cubit<AirLineState>
{
  AirLineCubit(AirLineState initialState) : super(initialState);

  static AirLineCubit get(context) => BlocProvider.of(context);

}