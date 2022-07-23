
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/car/bloc/car_states.dart';



class CarCubit extends Cubit<CarState>
{
  CarCubit(CarState initialState) : super(initialState);

  static CarCubit get(context) => BlocProvider.of(context);

}