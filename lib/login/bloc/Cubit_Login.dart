// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled1newone/login/bloc/States_Login.dart';
// import 'package:untitled1newone/login/datalayer/Login_Model.dart';
// import 'package:untitled1newone/login/datalayer/Login_Repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safariweb/login/bloc/States_Login.dart';
import 'package:safariweb/login/datalayer/Login_Model.dart';

class LoginCubit extends Cubit<LoginState>
{
  LoginModel loginModel = LoginModel();
  //final LoginRepository loginRepository;
  LoginCubit(LoginState initialState) : super(initialState);


}