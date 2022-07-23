import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:safariweb/admin/register/bloc/erg_states.dart';
import 'package:safariweb/admin/register/datalayer/reg_model.dart';
import 'package:safariweb/admin/register/datalayer/reg_services.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterModel data = RegisterModel();

  RegisterCubit(RegisterState initialState) : super(initialState);

  UpdateImage(File NewImage) {
    this.data.Image = NewImage;
    print("Inside Cubit");
    emit(ImageLoaded(this.data.Image!));
  }

  AuthAPI reg = AuthAPI();

  SendRequest(RegisterModel info) async {
    emit(LoadingState());
    print("Inside Cubit");

    Map<String, dynamic> Json = await info.RegisterToJson();

    var state = await reg.Register(Json);
 
    if (state == 200) {
      print("success");
      emit(SuccessState());
    } else {
      emit(ErrorState(message: state));
    }

    
  }


}
