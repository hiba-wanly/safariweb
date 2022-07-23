
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/restaurant/bloc/rest_states.dart';



class RestCubit extends Cubit<RestState>
{
  RestCubit(RestState initialState) : super(initialState);

  static RestCubit get(context) => BlocProvider.of(context);

}