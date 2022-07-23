import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/admin/add/bloc/states_bloc.dart';
import 'package:safariweb/admin/add/datalayer/model_add.dart';


class AddCubit extends Cubit<AddState> {
  AddCubit(AddState initialState) : super(initialState);

  static AddCubit get(context) => BlocProvider.of(context);


}
