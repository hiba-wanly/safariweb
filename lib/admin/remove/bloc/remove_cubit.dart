import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/admin/remove/bloc/remove_states.dart';

class ReomveCubit extends Cubit<RemoveState>{

  ReomveCubit(RemoveState initialState) : super(initialState);

  static ReomveCubit get(context) => BlocProvider.of(context);

  
}